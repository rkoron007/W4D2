class CatrentalrequestsController < ApplicationController

  def index
    @catrentalrequest = CatRentalRequest.all
    render :index
  end

  def show
    @catrentalrequest = CatRentalRequest.find_by(id: params[:id])
    render :show
  end

  def new
    @catrentalrequest = CatRentalRequest.new
    render :new
  end

  def create
    @catrentalrequest = CatRentalRequest.new(catrental_params)
    if @catrentalrequest.save
      redirect_to catrentalrequest_url(@catrentalrequest)
    else
      render json: @catrentalrequest.errors.full_messages
    end
  end

  def update
    @catrentalrequest = CatRentalRequest.find_by(id: params[:id])
    if @catrentalrequest.update_attributes(catrental_params)
      redirect_to catrentalrequest_url(@catrentalrequest)
    else
      render json: @catrentalrequest.errors.full_messages
    end
  end

  def edit
    @cat = CatRentalRequest.find_by(id: params[:id])
    render :edit
  end


  private

  def catrental_params
    params.require(:catrentalrequest).permit(:cat_id, :start_date, :end_date, :status)
  end


end
