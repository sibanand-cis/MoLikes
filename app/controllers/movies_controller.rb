class MoviesController < ApplicationController
  http_basic_authenticate_with :name => "movielike", :password => "please"
  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all

    render json: @movies
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find(params[:id])

    render json: @movie
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(params[:movie])
      head :no_content
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    head :no_content
  end

  def user_likes
    #Here is the action where user likes unlikes a movie from the show page.
    #Here we find a movie according to its id and then build like for the movie with the current_user_id from the if part
    #If the build is not valid we send it to else part where we again find the movie from the Like table and if present then we destroy the like
    @movie = Movie.find(params[:id])
    @user = User.find(params[:id])
    @like = @movie.likes.build({:user_id=> params[:user_id]})
      if @like.save
        render json: @like
      else
        @movie.likes.find(:first,:conditions=>["user_id = ?",@user.id]).destroy
        render json: @like.errors, status: :unprocessable_entity
      end
  end

end
       