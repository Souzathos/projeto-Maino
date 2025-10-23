class CommentsController < ApplicationController
  before_action :set_movie

  def create
    @comment = @movie.comments.new(comment_params)
    if user_signed_in?
      @comment.user = current_user
      @comment.name = current_user.name.presence || current_user.email.split("@").first
    end

    if @comment.save
      redirect_to movie_path(@movie, anchor: "comments"), notice: "Comentário adicionado!"
    else
      redirect_to movie_path(@movie, anchor: "comments"), alert: @comment.errors.full_messages.to_sentence
    end
  end

  private

  def set_movie
    @movie = Movie.find_by(id: params[:movie_id])
    redirect_to root_path, alert: "Filme não encontrado." unless @movie
  end

  def comment_params
    params.require(:comment).permit(:content, :name)
  end
end
