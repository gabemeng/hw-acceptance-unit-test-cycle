class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.findSameDirectors(id)
    movie = Movie.find(id)
    direc = movie.director
    movies = Movie.where(director: direc)
  end 
  
end
