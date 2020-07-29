require 'rails_helper'

describe MoviesController do
  describe "director" do 
    before(:each) do 
      mockMovie = double(Movie, :title => "Nemo", :director => "disney", :id => "1")
      mockMovie2 = double(Movie, :title => "Wall-E", :director => "disney", :id => "2")
      mockMovie3 = double(Movie, :title => "Dory", :director => "disney", :id => "1")
    end 
    #it "should call method to find movies with same director"
    
    #end
    #it "should redirect to home if director doesn't exist"
      
    #end 
  end 
  
  describe "find by director with director filled out" do 
    before :each do
      mockMovie = double(Movie, :title => "Nemo", :director => "disney", :id => "1")
      Movie.stub(:findSameDirectors).with('1').and_return(mockMovie)
    end
  
    it 'should correctly route when finding movies with same director' do
      { :get => same_director_path(1) }.should route_to(:controller => "movies", :action => "director", :id => "1")
    end
    it 'should call the findSameDirectors method' do
      mockReturn = [double('mock1'), double('mock2')]
      Movie.should_receive(:findSameDirectors).with('director').and_return(mockReturn)
      #get :director, {:id => "1"}
    end
    it 'should select the Find Director template for rendering' do
      mockReturn = [double('mock1'), double('mock2')]
      Movie.stub(:findSameDirectors).with('1').and_return(mockReturn)
      get :director, :id => 1
      response.should render_template('director')
    end
    it 'should display movies with same directors' do
      mockReturn = [double('mock1'), double('mock2')]
      Movie.should_receive(:findSameDirector).with('1').and_return(mockReturn)
      get :director, :movie_id => 1
      assigns(:movies).should == fake_results
    end
  end
  
  describe "find by director without director filled" do 
    
end 
   
    
    
    