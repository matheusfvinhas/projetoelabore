# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event, type: :model do
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
      @event = Event.create(title: "Event de teste", description: "Event criado para teste",
                              local: "Rua dos teste, 1337", date: "21/12/2016", time: "21:00", user_id: @user.id)
      expect(@event).to be_valid
    end

    it "without title" do
      @event = Event.create(description: "Event criado para teste",
                              local: "Rua dos teste, 1337", date: "21/12/2016", time: "21:00", user_id: @user.id)
      expect(@event).to be_invalid
    end

    it "without description" do
      @event = Event.create(title: "Event de teste",
                              local: "Rua dos teste, 1337", date: "21/12/2016", time: "21:00", user_id: @user.id)
      expect(@event).to be_invalid
    end

    it "without local" do
      @event = Event.create(title: "Event de teste", description: "Event criado para teste",
                              date: "21/12/2016", time: "21:00", user_id: @user.id)
      expect(@event).to be_invalid
    end

    it "without date" do
      @event = Event.create(title: "Event de teste", description: "Event criado para teste",
                              local: "Rua dos teste, 1337", time: "21:00", user_id: @user.id)
      expect(@event).to be_invalid
    end

    it "without time" do
      @event = Event.create(title: "Event de teste", description: "Event criado para teste",
                              local: "Rua dos teste, 1337", date: "21/12/2016", user_id: @user.id)
      expect(@event).to be_invalid
    end

    it "without usuario" do
      @event = Event.create(title: "Event de teste", description: "Event criado para teste",
                              local: "Rua dos teste, 1337", date: "21/12/2016", time: "21:00")
      expect(@event).to be_invalid
    end

    it "title has more then 100 characters" do
      @event = Event.create(title: (0..101).map { ("a".."z").to_a[rand(26)] }.join, description: "Event criado para teste",
                              local: "Rua dos teste, 1337", date: "21/12/2016", time: "21:00", user_id: @user.id)
      expect(@event).to be_invalid
    end

    it "description has more then 255 characters" do
      @event = Event.create(title: "Event de teste", description: (0..256).map { ("a".."z").to_a[rand(26)] }.join,
                              local: "Rua dos teste, 1337", date: "21/12/2016", time: "21:00", user_id: @user.id)
      expect(@event).to be_invalid
    end

    it "local has more then 100 characters" do
      @event = Event.create(title: "Event de teste", description: "Event criado para teste",
                              local: (0..101).map { ("a".."z").to_a[rand(26)] }.join, date: "21/12/2016", time: "21:00", user_id: @user.id)
      expect(@event).to be_invalid
    end
  end
end
