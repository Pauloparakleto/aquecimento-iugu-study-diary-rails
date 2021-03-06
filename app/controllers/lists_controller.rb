class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end
end
