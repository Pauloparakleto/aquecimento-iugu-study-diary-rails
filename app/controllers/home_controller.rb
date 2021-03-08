class HomeController < ApplicationController
  def welcome
    @q = List.ransack(params[:q])
    @lists = @q.result(distinct: true)
  end
end
