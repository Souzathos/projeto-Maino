class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_movie, only: %i[show edit update destroy]
  before_action :authorize_owner!, only: %i[edit update destroy]

  def index
    @categories = Category.all
    @movies = Movie.order(created_at: :desc)

    # 🔍 Busca geral (título, diretor ou ano)
    if params[:q].present?
      search = "%#{params[:q]}%"
      @movies = @movies.where(
        "title ILIKE ? OR director ILIKE ? OR CAST(year AS TEXT) ILIKE ?",
        search, search, search
      )
    end

    # 🎯 Filtro por categoria
    if params[:category_id].present?
      @movies = @movies.joins(:categories).where(categories: { id: params[:category_id] })
    end

    @movies = @movies.page(params[:page]).per(6)
  end

  def save_categories(names)
    return if names.blank?

    self.categories = names.split(",").map do |name|
      Category.find_or_create_by(name: name.strip.titleize)
    end
  end

  def show
    @comment = Comment.new
    @comments = @movie.comments.newest
  end

  def new
    @movie = current_user.movies.new
  end

  def create
    @movie = current_user.movies.build(movie_params)

    if @movie.save
      @movie.save_categories(movie_params[:category_names])
      redirect_to @movie, notice: "Filme criado com sucesso!"
    else
      load_categories
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      @movie.save_categories(movie_params[:category_names])
      redirect_to @movie, notice: "Filme atualizado!"
    else
      load_categories
      render :edit
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
    params.require(:movie).permit(:title, :synopsis, :year, :duration, :director, :poster, :category_names)
  end



end
