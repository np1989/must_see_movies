class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @directors = Director.all

  end

  def show
    @movie = Movie.find(params[:id])
    @directors = Director.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new
    @movie.director_id = params[:director_id]
    @movie.image_url = params[:image_url]
    @movie.description = params[:description]
    @movie.duration = params[:duration]
    @movie.year = params[:year]
    @movie.title = params[:title]

    if @movie.save
      redirect_to "/movies", :notice => "Movie created successfully."
    else
      render 'new'
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.director_id = params[:director_id]
    @movie.image_url = params[:image_url]
    @movie.description = params[:description]
    @movie.duration = params[:duration]
    @movie.year = params[:year]
    @movie.title = params[:title]

    if @movie.save
      redirect_to "/movies", :notice => "Movie updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy

    redirect_to "/movies", :notice => "Movie deleted."
  end
end
