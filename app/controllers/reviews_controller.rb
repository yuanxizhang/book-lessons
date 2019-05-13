class ReviewsController < ApplicationController
	before_action :find_review, only: [:show, :edit, :update]
  before_action :require_login, except: [:index, :show]

	def index
		if params[:instructor_id]
        @instructor = Instructor.find(params[:instructor_id])
        @reviews = @instructor.reviews.latest_first
    else
		    @reviews = Review.all.latest_first
    end
	end

	def new
		@review = Review.new
	end

	def show

	end

	def create
	  @review = Review.new(review_params)

	  if @review.valid?
	  	@review.save
	  	redirect_to instructor_path(@review.instructor_id)
	  else
	  	render :new
	  end
	end

	def edit

	end

	def update

	  @review.update(review_params)
	  if @review.save
	  	redirect_to istructor_path(@review.instructor_id)
	  else
	  	render :edit
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
