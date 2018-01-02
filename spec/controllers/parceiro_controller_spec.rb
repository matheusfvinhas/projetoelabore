require 'rails_helper'

RSpec.describe ParceirosController, type: :controller do
          
  describe "GET new" do
    it "get new @parceiro" do      
      get :new
      expect(response).to be_success
    end      
  end 

end
