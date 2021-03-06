class MoviesController < ApplicationController
#///////////////////////////////////////////
  def search_director
    m = Movie.find_by_id(params[:id])
    @director = m.director
    if @director.blank?
      flash[:notice] = "'#{m.title}' has no director info"
      redirect_to movies_path
    else
      @movies = Movie.find_similar(@director)
    end
  end
#/////////////////////////////////////////
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    sort = params[:sort] || session[:sort]
    case sort
    when 'title'
      ordering,@title_header = {:order => :title}, 'hilite'
    when 'release_date'
      ordering,@date_header = {:order => :release_date}, 'hilite'
    end
    @all_ratings = Movie.all_ratings
    @selected_ratings = params[:ratings] || session[:ratings] || {}

    if params[:sort] != session[:sort]
      session[:sort] = sort
      flash.keep
      redirect_to :sort => sort, :ratings => @selected_ratings and return
    end

    if params[:ratings] != session[:ratings] and @selected_ratings != {}
      session[:sort] = sort
      session[:ratings] = @selected_ratings
      flash.keep
      redirect_to :sort => sort, :ratings => @selected_ratings and return
    end
    @movies = Movie.find_all_by_rating(@selected_ratings.keys, ordering)
  end

  def new
    # default: render 'new' template
  end

  def create
    #@movie = Movie.create!(params[:movie])
    #flash[:notice] = "#{@movie.title} was successfully created."
    #redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    #@movie = Movie.find params[:id]
    #@movie.destroy
    #flash[:notice] = "Movie '#{@movie.title}' deleted."
    #redirect_to movies_path
  end
#////////////////////////////////////////
  def find_similar
    #@movie = Movie.find params[:id]
    #if @movie.director =~ /(\S+)/
    #  @movies = @movie.find_similar
    #else
    #  flash[:notice] = "'#{@movie.title}' has no director info"
    #  redirect_to movies_path
    #end
  end
=begin
  def director
    if (params[:id] == nil) 
      return
    end
    @id = params[:id]
    @director = Movie.find(@id).director
    if (@director != nil && @director != "")
      @d = @director
      @movies = Movie.find_by_director(@director)
    else
      @title = Movie.find(@id).title
      flash[:warning] = "'" + @title + "' has no director info"
      redirect_to movies_path
    end
  end
=end
#///////////////////////////////////////
#    session[:back] = true
#    @movie = Movie.find(params[:id])
#    @movie.destroy
#    flash[:notice] = "Movie '#{@movie.title}' deleted."
#    redirect_to movies_path ({:sort => session[:sort], :checked_ratings => session[:checked_ratings]})
#////////////////////////////////////////
end
