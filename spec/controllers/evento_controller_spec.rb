require 'rails_helper'

RSpec.describe EventosController, type: :controller do

    describe "GET show" do
        it "get @evento" do      
          get :show
          expect(response).to be_success
        end      
      end  
      
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

      describe "GET edit" do
        it "get @evento" do      
          get :edit
          expect(response).to be_success
        end      
      end 

end
