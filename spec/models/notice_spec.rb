# frozen_string_literal: true

require "rails_helper"

RSpec.describe Notice, type: :model do
  before(:all) do
    @institution = Institution.create(name: "Elabore", manager: "Lesle Maciel")
    @user = User.create(email: "matheusfvinhas@gmail.com", password: "rap007",
      kind: :student, name: "Matheus", institution_id: @institution.id)
  end

  after(:all) do
    User.delete(@user)
    Institution.delete(@institution)
  end

  context "validations" do
    it "is valid" do
      @notice = Notice.create(title: "Notice de teste", description: "Notice criado para teste", user_id: @user.id)
      expect(@notice).to be_valid
    end

    it "without title" do
      @notice = Notice.create(description: "Notice criado para teste", user_id: @user.id)
      expect(@notice).to be_invalid
    end

    it "without description" do
      @notice = Notice.create(title: "Notice de teste", user_id: @user.id)
      expect(@notice).to be_invalid
    end

    it "without usuario" do
      @notice = Notice.create(title: "Notice de teste", description: "Notice criado para teste")
      expect(@notice).to be_invalid
    end

    it "title has more then 100 characters" do
      @notice = Notice.create(title: (0..101).map { ("a".."z").to_a[rand(26)] }.join, description: "Notice criado para teste", user_id: @user.id)
      expect(@notice).to be_invalid
    end

    it "description has more then 255 characters" do
      @notice = Notice.create(title: "Notice de teste", description: (0..256).map { ("a".."z").to_a[rand(26)] }.join, user_id: @user.id)
      expect(@notice).to be_invalid
    end
  end
end
