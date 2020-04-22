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

  def get_episode_data
    data_hash = get_episode_info(params['imdb_id'])

    render :json => data_hash
  end

  def get_omdb_data
    data_hash = get_omdb_info(params['q'])

    render :json => data_hash
  end
  
  private
end
