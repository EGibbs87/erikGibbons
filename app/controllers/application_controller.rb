class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  include GetData
  
  # send the user to the angular application by default
  def angular
    @angular_app = "ErikGibbons"
    render "layouts/application", layout: false
  end

  def contact
    ContactMailer.contact(params).deliver_now
    
    render :nothing => true
  end
  
  def angular_charts
    @angular_app = "TVCharts"
    render "layouts/application", layout: false
  end

  def get_omdb_data
    data_hash = get_omdb_info(params['q'])

    render :json => data_hash
  end

  def get_omdb_batch_data
    queries = params['q'].split("|")
    data_arr = []
    for q in queries do
      data_arr << get_omdb_info(q)
    end

    render :json => data_arr
  end

  def get_episode_data
    data_hash = get_episode_info(params['imdb_id'], params['title'])

    render :json => data_hash
  end

  def get_episode_batch_data
    queries = params['q'].split("|")
    data_arr = []
    for q in queries do
      imdb_id, title = q.split(",")
      data_arr << get_episode_info(imdb_id, title)
    end

    render :json => data_arr
  end

  def get_episode_data_ng2
    output = get_info_ng2(params['q'])

    render :json => output
  end

  def ppp_lending
    @angular_app = "PPPLending"

    render "layouts/application", layout: false
  end  

  def ppp_contact
    ContactMailer.contact(params).deliver_now
    
    render :nothing => true
  end
 
  private
end
