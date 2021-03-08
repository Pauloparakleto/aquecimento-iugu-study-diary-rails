class ListsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_search

  def index
    @q = List.ransack(params[:q])
    @lists = @q.result(distinct: true)
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_url(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end

  private
    def list_params
      params.require(:list).permit(:name, :description, :category)
    end
end
