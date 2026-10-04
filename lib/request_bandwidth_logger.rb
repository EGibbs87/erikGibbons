# One log line per request, including requests lograge cannot see.
#
# lograge only wraps `process_action.action_controller`, so it never observes a
# request served by ActionDispatch::Static — which is every /assets hit, and
# therefore nearly all of this app's egress. This middleware sits above Static
# so it records those too, which is what makes per-host byte attribution
# possible (erikgibbons.com vs tvcharts.erikgibbons.com) and what makes
# non-JS crawlers visible at all — they never reach Google Analytics.
#
# Byte count comes from the content-length header rather than by measuring the
# body, so nothing is buffered and file responses stay lazy. Responses without
# content-length (streamed, or 304) log bytes=0.
class RequestBandwidthLogger
  MAX_PATH = 200
  MAX_UA   = 120

  def initialize(app)
    @app = app
  end

  def call(env)
    started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    status, headers, body = @app.call(env)
    emit(env, status, headers, body, started)
    [status, headers, body]
  rescue Exception # log the request, then let the real handler deal with it
    emit(env, 500, {}, nil, started)
    raise
  end

  private

  def emit(env, status, headers, body, started)
    ms = ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - started) * 1000).round(1)
    line = +"bw"
    line << " host=#{env['HTTP_HOST']}"
    line << " method=#{env['REQUEST_METHOD']}"
    line << " path=#{truncate(path_with_query(env), MAX_PATH)}"
    line << " status=#{status}"
    line << " bytes=#{bytes(headers, body)}"
    line << " ms=#{ms}"
    line << " ip=#{client_ip(env)}"
    line << " ua=#{truncate(env['HTTP_USER_AGENT'].to_s, MAX_UA).inspect}"
    logger.info(line)
  rescue StandardError => e
    # Logging must never break a response.
    logger.warn("bw logging failed: #{e.class}: #{e.message}") rescue nil
  end

  # Static files carry content-length, so their size is free to read. Dynamic
  # responses often reach this middleware before the server has added the
  # header, so fall back to measuring the body — but only when Rack guarantees
  # it is fully buffered (`to_ary`, per the spec). A streaming or file body is
  # never consumed here; it reports 0 rather than risk breaking the response.
  def bytes(headers, body)
    len = headers["content-length"] || headers["Content-Length"]
    return len.to_i if len

    return body.to_ary.sum(&:bytesize) if body.respond_to?(:to_ary)

    0
  end

  def path_with_query(env)
    q = env["QUERY_STRING"]
    q.to_s.empty? ? env["PATH_INFO"].to_s : "#{env['PATH_INFO']}?#{q}"
  end

  # Render fronts the app with a proxy, so REMOTE_ADDR is the proxy. The first
  # X-Forwarded-For entry is the real client.
  def client_ip(env)
    fwd = env["HTTP_X_FORWARDED_FOR"]
    return env["REMOTE_ADDR"] if fwd.nil? || fwd.empty?
    fwd.split(",").first.to_s.strip
  end

  def truncate(str, max)
    str.length > max ? "#{str[0, max]}…" : str
  end

  def logger
    Rails.logger || @fallback ||= Logger.new($stdout)
  end
end
