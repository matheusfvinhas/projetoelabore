# frozen_string_literal: true

require "rails_helper"

RSpec.describe Partner, type: :model do
  context "validations" do
    it "is valid" do
      @partner = Partner.create(name: "Novo partner", email: "partner@partner.com.br",
                                  about: "Bom partner")
      expect(@partner).to be_valid
    end

    it "without email" do
      @partner = Partner.create(name: "Novo partner",
                                  about: "Bom partner")
      expect(@partner).to be_invalid
    end

    it "without name" do
      @partner = Partner.create(email: "partner@partner.com.br",
                                  about: "Bom partner")
      expect(@partner).to be_invalid
    end

    it "without about" do
      @partner = Partner.create(name: "Novo partner", email: "partner@partner.com.br")
      expect(@partner).to be_invalid
    end

    it "name has more then 50 characters" do
      @partner = Partner.create(name: (0..51).map { ("a".."z").to_a[rand(26)] }.join, email: "partner@partner.com.br",
                                  about: "Bom partner")
      expect(@partner).to be_invalid
    end

    it "name has more then 50 characters" do
      @partner = Partner.create(name: "Novo partner", email: (0..51).map { ("a".."z").to_a[rand(26)] }.join,
                                  about: "Bom partner")
      expect(@partner).to be_invalid
    end

    it "about has more then 5000 characters" do
      @partner = Partner.create(name: "Novo partner", email: "partner@partner.com.br",
                                  about: (0..5001).map { ("a".."z").to_a[rand(26)] }.join)
      expect(@partner).to be_invalid
    end
  end
end
