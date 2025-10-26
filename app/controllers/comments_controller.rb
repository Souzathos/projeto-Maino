class CommentsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.new(comment_params)
    
    if user_signed_in?
      @comment.user = current_user
      @comment.name = current_user.name.presence ||
                      current_user.email.split("@").first.capitalize
    else
      @comment.name = "Anônimo" if @comment.name.blank?
    end

    if @comment.save
      redirect_to @movie, notice: "Comentário enviado!"
    else
      redirect_to @movie, alert: "Erro ao comentar."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :name)
  end
end
