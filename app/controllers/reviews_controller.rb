class ReviewsController < ApplicationController
	def create
		#binding.pry
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		#binding.pry
		if @review.save
			#binding.pry
			redirect_to article_path(@review.article), notice: "Thank you for adding comments"
		else
			redirect_to article_path(@review.article), notice: "not save"
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to article_path(@review.article_id)
	end

	private

	def review_params
		params[:review].permit(:body,:article_id)
	end
end
