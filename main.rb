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
	erb(:question)
end


#post 9 movies + question

#post checks answer

#get shows result for answer 