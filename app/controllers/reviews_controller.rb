class ReviewsController < ApplicationController
	before_action :find_review, only: [:show, :edit, :update]
  before_action :require_login, except: [:index, :show]

	def index
		if params[:instructor_id]
        @instructor = Instructor.find(params[:instructor_id])
        @reviews = @instructor.reviews.latest_first
    else
		    redierct_to instructors_path
    end
	end

	def new
		@review = Review.new
	end

	def create
	  @review = Review.new(review_params)

	  if @review.valid?
	  	@review.save
	  	redirect_to instructor_reviews_path(@review.instructor_id, @review.instructor.reviews)
	  else
	  	render :new
	  end
	end

	private

	def find_review
    @review = Review.find_by(id: params[:id])
  end

	def review_params
    params.permit(:user_id, :instructor_id, :rating, :body)
  end

end
