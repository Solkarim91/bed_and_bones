class ReviewsController < ApplicationController

    def new
      @pet = Pet.find(params[:pet_id])
      @review = Review.new
      @booking = Booking.find(params[:booking_id])
    end

    def create
      @review = Review.new(review_params)
      @booking = Booking.find(params[:booking_id])
      @review.booking = @booking
      if @review.save
        redirect_to pet_path(@booking.pet)
      else
        render :new
      end
    end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
