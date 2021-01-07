class DestinationsController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :update, :edit, :destroy]
  # before_action :search_article, only: [:show, :search]
  # before_action :move_to_index, except: [:index, :show, :search]

  def index
    @destinations = Destination.all.order('created_at DESC')
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

    @destinations = Destination.all.order('created_at DESC')
    @destinations = @destination
    # @article = Article.find(params[:id])
    @articles = @destination.articles.includes(:user)
  end

  def search
    # @destinations = Destination.search(params[:keyword])
    # @article = Article.all
    # @articles = @destinations.articles.includes(:user)
    # @articles = Article.find_by(id: params[:destination_id])
    # @results = @p.result.includes(:destination) 
    @articles = Article.search(params[:keyword])
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path unless current_user.id != @item.user.id
    @item.destroy
  end

  private

  def destination_params
    # params.require(:destination).permit(:name, :bus_stop_id, :line_id, :image)
    params.require(:destination).permit(:name, :bus_stop_id, :line_id, images: [])
  end

  def set_item
    @destination = Destination.find(params[:id])
  end

  # def search_article
  #   @p = Article.ransack(params[:q])
  # end
  

end