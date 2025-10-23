class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_movie, only: %i[show edit update destroy]
  before_action :authorize_owner!, only: %i[edit update destroy]

  def index
    @movies = Movie.newest.page(params[:page]).per(6)
  end

  def show
    @comment = Comment.new
    @comments = @movie.comments.newest
  end

  def new
    @movie = current_user.movies.new
  end

  def create
    @movie = current_user.movies.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Filme criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Filme atualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, notice: "Filme apagado."
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def authorize_owner!
  redirect_to @movie, alert: "Você não pode editar esse filme." unless @movie.user_id == current_user&.id
end

  def movie_params
    params.require(:movie).permit(:title, :synopsis, :year, :duration, :director)
  end
end
