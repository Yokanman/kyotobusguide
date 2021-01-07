class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth
  # before_action :search_article


  def index
    @destination = Destination.all
  end

  # def search
  #   @results = @p.result.includes(:destination)
  # end

  def search
    @articles = Article.search(params[:keyword])
  end


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :family_name])
  end

  # def search_article
  #   @p = Article.ransack(params[:q])
  #   @articles = @p.result
  #   # @p = Article.ransack(params[:q])
  # end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end