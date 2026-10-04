# Gives Sprockets' digest-fingerprinted assets a permanent cache lifetime.
#
# Their filenames contain a content hash, so a given URL's bytes can never
# change — they are safe to cache forever, and a returning visitor should
# re-download none of them.
#
# This has to be a middleware rather than `config.public_file_server.headers`,
# because that setting applies one header hash to everything under /public.
# robots.txt, favicon.ico and the 404/422/500 pages are NOT digested, so a
# year-long immutable cache on those would make them un-editable in practice.
# Those keep the short TTL set in config/environments/production.rb.
class StaticCacheHeaders
  # e.g. /assets/application-09fe4bfa...a27daf63.js  (Sprockets uses a 64-char
  # SHA-256 digest; the older 32-char MD5 form is matched too.)
  DIGESTED_ASSET = %r{\A/assets/.+-\h{32,64}\.\w+\z}

  IMMUTABLE = "public, max-age=31536000, immutable"

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    # Rack 3 requires lowercase header field names.
    headers["cache-control"] = IMMUTABLE if cacheable?(env, status)
    [status, headers, body]
  end

  private

  def cacheable?(env, status)
    (status == 200 || status == 304) &&
      DIGESTED_ASSET.match?(env["PATH_INFO"].to_s)
  end
end
