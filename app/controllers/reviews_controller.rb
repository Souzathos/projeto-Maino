class ReviewsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)
    @review.user = current_user if user_signed_in?

    if @review.save
      redirect_to @movie
    else
      redirect_to @movie, alert: "Erro ao enviar avaliação."
    end
  end

  def review_params
    params.require(:review).permit(:rating)
  end
end