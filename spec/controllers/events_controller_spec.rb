# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Events", type: :request do
  describe "GET new" do
    it "get new @event" do
      get new_event_path
      expect(response).to be_successful
    end
  end

  describe "GET index" do
    it "get @events" do
      get events_path
      expect(response).to be_successful
    end
  end
end
