require 'rails_helper'

describe MoviesController do
  #describe "director" do 
   # before(:each) do 
      #mockMovie = double(Movie, :title => "Nemo", :director => "disney", :id => "1")
      #mockMovie2 = double(Movie, :title => "Wall-E", :director => "disney", :id => "2")
      #mockMovie3 = double(Movie, :title => "Dory", :director => "disney", :id => "1")
    #end 
    #it "should call method to find movies with same director"
    
    #end
    #it "should redirect to home if director doesn't exist"
      
    #end 
  #end 
  
  describe 'find by director with director filled out' do 
    before :each do
      mockMovie = double(Movie, :title => "Nemo", :director => "disney", :id => "1")
      Movie.stub(:find).with('1').and_return(mockMovie)
    end
  
    it 'should correctly route when finding movies with same director' do
      {:get => same_director_path(1)}.should route_to(:controller => "movies", :action => "director", :id => "1")
    end
    it 'should call the findSameDirectors method' do
      mockReturn = [double('mock1'), double('mock2')]
      Movie.should_receive(:findSameDirectors).with('1').and_return(mockReturn)
      get :director, :id => 1
    end
    it 'should render the director page' do
      mockReturn = [double('mock1'), double('mock2')]
      Movie.stub(:findSameDirectors).with('1').and_return(mockReturn)
      get :director, :id => 1
      expect(response).to render_template('director')
    end
    it 'should display movies with same directors' do
      mockReturn = [double('mock1'), double('mock2')]
      Movie.should_receive(:findSameDirectors).with('1').and_return(mockReturn)
      get :director, :id => 1
      expect(assigns(:movies)).to eq(mockReturn)
    end
  end
  
  describe 'find by director without director filled' do 
    before :each do
      mockMovie = double(Movie, :title => "Nemo", :director => '', :id => "100")
      Movie.stub(:find).with('100').and_return(mockMovie)
    end
    it 'should redirect to movies_path aka home page' do 
      get :director, :id => 100
      expect(response).to redirect_to(movies_path)
    end 
    it 'should flash notice' do 
      get :director, :id => 100
      expect(flash[:notice]).to be_present
    end 
  end 
  
  describe 'create' do 
    it 'should create a new movie' do 
     #movie = double(Movie, :title => "DORY", :director => 'pixar', :id => '500')
     #Movie.stub(:create!).with(movie).and_return(movie)
     #post :create
    end 
  end 
  
  describe 'destroy' do 
    it 'should delete an existing movie' do
      movie = double(Movie, :title => "DORY", :director => 'pixar', :id => '500')
      Movie.stub(:find).with('500').and_return(movie)
      expect(movie).to receive(:destroy)
      delete :destroy, {:id => '500'}
 
    end 
  end 
end 
   
    
    
    