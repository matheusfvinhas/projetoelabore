require 'rails_helper'

RSpec.describe EditaisController, type: :controller do

    describe "GET show" do
        it "get @edital" do      
          get :show
          expect(response).to be_success
        end      
      end  
      
      describe "GET new" do
        it "get new @edital" do      
          get :new
          expect(response).to be_success
        end      
      end 

      describe "GET index" do
        it "get @editais" do      
          get :index
          expect(response).to be_success
        end      
      end 

      describe "GET edit" do
        it "get @edital" do      
          get :edit
          expect(response).to be_success
        end      
      end 

end
