class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_movie, only: %i[show edit update destroy]
  before_action :authorize_owner!, only: %i[edit update destroy]

  def index
    @categories = Category.all

    if params[:search].present?
      search_query = "%#{params[:search]}%".downcase

      @movies = Movie
        .left_joins(:categories, :tags)
        .where(
          "LOWER(movies.title) LIKE ? OR LOWER(movies.director) LIKE ? OR CAST(movies.year AS TEXT) LIKE ? OR LOWER(categories.name) LIKE ? OR LOWER(tags.name) LIKE ?",
          search_query, search_query, search_query, search_query, search_query
        )
        .distinct
        .order(created_at: :desc)
        .page(params[:page]).per(6)

    elsif params[:category_id].present?
      @movies = Movie.joins(:categories)
                     .where(categories: { id: params[:category_id] })
                     .order(created_at: :desc)
                     .page(params[:page]).per(6)

    else
      @movies = Movie.order(created_at: :desc).page(params[:page]).per(6)
    end
  end

  def show
    @comment = Comment.new
    @comments = @movie.comments.order(created_at: :desc)
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(movie_params)

    if @movie.save
      @movie.save_categories(movie_params[:category_names])
      @movie.save_tags(movie_params[:tag_names])
      redirect_to @movie, notice: "Filme criado com sucesso!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      @movie.save_categories(movie_params[:category_names])
      @movie.save_tags(movie_params[:tag_names])

      @movie.poster.purge if params[:movie][:remove_poster] == "1"

      redirect_to @movie, notice: "Filme atualizado!"
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, notice: "Filme removido."
  end

  def import
    file = params[:file]

    if file.nil?
      redirect_to movies_path, alert: "Selecione um arquivo CSV!" and return
    end

    require "csv"
    CSV.foreach(file.path, headers: true) do |row|
      movie = current_user.movies.new(
        title: row["title"] || row["titulo"],
        synopsis: row["synopsis"] || row["sinopse"],
        year: row["year"] || row["ano"],
        duration: row["duration"] || row["duracao"],
        director: row["director"] || row["diretor"]
      )

      if movie.save
        movie.save_categories(row["categories"]) if row["categories"].present?
        movie.save_tags(row["tags"]) if row["tags"].present?
      end
    end

    redirect_to movies_path, notice: "✅ Importação concluída com sucesso!"
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(
      :title, :synopsis, :year, :duration, :director, :poster,
      :category_names, :tag_names
    )
  end

  def authorize_owner!
    redirect_to movies_path, alert: "Você não tem permissão para isso!" unless @movie.user == current_user
  end
end
