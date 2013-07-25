require_relative '../spec_helper'

describe MoviesController do
  before(:each) do
    @user =   FactoryGirl.create(:user)
    @movie =  FactoryGirl.create(:movie)
  end
  describe "Like a movie" do
    it "should like movie through likes" do
      params = {:user_id => @user.id,:movie_id =>@movie.id} 
      get :user_likes, :id => "1", :user_id => @user.id,:movie_id =>@movie.id,:format => :json
      response.response_code.should == 201
    end
  end

  describe "Unlike a movie" do
    
    it "should unlike movie if already liked" do
      @like = Like.create({:user_id=>@user.id,:movie_id=>@movie.id})
      get :user_likes, :id => "1", :user_id => @user.id,:movie_id =>@movie.id,:format => :json
      response.response_code.should == 200
    end
  end
  
  end

