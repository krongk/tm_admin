require 'spec_helper'

describe SController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'search'" do
    it "returns http success" do
      get 'search'
      response.should be_success
    end
  end

  describe "GET 'tag'" do
    it "returns http success" do
      get 'tag'
      response.should be_success
    end
  end

  describe "GET 'book'" do
    it "returns http success" do
      get 'book'
      response.should be_success
    end
  end

  describe "GET 'comment'" do
    it "returns http success" do
      get 'comment'
      response.should be_success
    end
  end

  describe "GET 'forward'" do
    it "returns http success" do
      get 'forward'
      response.should be_success
    end
  end

  describe "GET 'digg'" do
    it "returns http success" do
      get 'digg'
      response.should be_success
    end
  end

end
