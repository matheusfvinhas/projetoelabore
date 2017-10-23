require 'rails_helper'

RSpec.describe EventosController, type: :controller do

  describe "GET new" do
    it "get new @evento" do      
      get :new
      expect(response).to be_success
    end      
  end 

  describe "GET index" do
    it "get @eventos" do      
      get :index
      expect(response).to be_success
    end      
  end     

end
