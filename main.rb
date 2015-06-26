require 'sinatra'
require 'sinatra/reloader' if development?

enable(:sessions)

get '/' do
	erb(:search)
end

#post 9 movies + question

#post checks answer

