class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_destination, only: [:index]
  # before_action :search_article, only: [:index, :search]


  def index
    # redirect_to root_path unless current_user.id != @item.user_id
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
    #   @destination = Destination.find(params[:destination_id])
      render action: :index
      # redirect_to root_path
    end
  end

  # def search
  #   # @destinations = Destination.search(params[:keyword])
  #   @articles = Article.search(params[:keyword])
  # end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:image, :title, :detail).merge(user_id: current_user.id, destination_id: params[:destination_id])
    # params.require(:article).permit(:title, :detail, destination_ids: []).merge(user_id: current_user.id,)
  end

  def set_destination
    @destination = Destination.find(params[:destination_id])
  end

end

