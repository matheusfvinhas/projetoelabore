# frozen_string_literal: true

require "rails_helper"

RSpec.describe PartnersController, type: :controller do


  describe "GET new" do
    it "get new @partner" do
      get :new
      expect(response).to be_successful
    end
  end
end
