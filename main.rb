require 'sinatra'
require 'sinatra/reloader' if development?
require 'imdb'
require_relative "Filter.rb"

enable(:sessions)

filter = Filter.new

searched_title = []

get '/' do
	erb(:search)
end

post '/question' do
	@search = Imdb::Search.new(params[:search])
	@filtered_movies = filter.movie_filter(@search.movies[0..20])
	@rando_movie = @filtered_movies.sample
	@year = @rando_movie.year 
	session[:selection] = @rando_movie.id

	erb(:question)
end

post'/check' do
	if session[:selection] == params[:selection]
		redirect to ('/win')
	else 
		redirect to ('/lose')
	end
end

get '/win' do
	erb(:win)
end

get '/lose' do
	erb(:lose)
end