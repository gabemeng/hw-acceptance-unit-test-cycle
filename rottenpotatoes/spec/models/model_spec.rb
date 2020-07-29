require 'rails_helper'

describe Movie do
  describe "get all ratings" do
    it "returns all possible ratings" do
      expect(Movie.all_ratings).to eq(['G', 'PG', 'PG-13', 'NC-17', 'R'])
    end 
  end 
  
  describe "finds movies" do 
    before(:each) do 
      Movie.create(:title => "Nemo", :director => "disney", :id => "100")
      Movie.create(:title => "Wall-E", :id => "200")
      #Movie.create(:title => "Dory", :director => "disney", :id => "300")
      #Movie.create(:title => "Avengers", :director => "marvel", :id => "400")
    end 
    it "returns movies with same director" do 
      movies = Movie.findSameDirectors(100)
      expect(movies[0].title).to eq('Nemo')
    end 
    it "does not return movies with different directors" do
      testMovie = Movie.where(title: 'Chocolat')
      expect(Movie.findSameDirectors(100)).not_to include(testMovie)
    end
  end 
      
end 