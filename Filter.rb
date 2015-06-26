class Filter
	def movie_filter(movies)
		good_movies = []
		movies.each do |movie|
			if !movie.poster.nil? 
			good_movies.push(movie)
			end
		end
	return good_movies[0..8]
	end
end
