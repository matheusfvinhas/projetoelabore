# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Notices", type: :request do

  describe "GET new" do
    it "get new @notice" do
      get new_notice_path
      expect(response).to be_successful
    end
  end

  describe "GET index" do
    it "get @notices" do
      get notices_path
      expect(response).to be_successful
    end
  end
end
