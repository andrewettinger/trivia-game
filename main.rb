require 'sinatra'
require 'sinatra/reloader' if development?
require 'imdb'

enable(:sessions)

searched_title = []

get '/' do
	erb(:search)
end

post '/question' do
	@search = Imdb::Search.new(params[:search])
	@filtered_movies = movie_filter(@search.movies[0..20])
	erb(:question)
end

def movie_filter(movies)
	good_movies = []
	movies.each do |movie|
		if !movie.poster.nil? 
		good_movies.push(movie)
		end
	end
return good_movies[0..8]
end


#post 9 movies + question

#post checks answer

#get shows result for answer 