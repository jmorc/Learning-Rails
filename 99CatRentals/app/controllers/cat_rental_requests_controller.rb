class CatRentalRequestsController < ApplicationController
  def new
    @request = CatRentalRequest.new
    @cats = Cat.all
  end
  
  def create
    @request = CatRentalRequest.new(request_params)
    if @request.save
      redirect_to cat_url(@request.cat)
    else
    end
  end
  
  def approve
    @cat = Cat.find(params[:id])
    @cat.approve!
  end
  
  def deny
    @cat = Cat.find(params[:id])
    @cat.deny!
  end
  
  private
  def request_params
    params[:request].permit(:start_date, :end_date, :cat_id)
  end
end
