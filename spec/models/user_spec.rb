# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do   
  before(:all) do
    Institution.create!(name: 'Elabore', manager: 'Lesle Maciel')
  end

    context 'kind' do
    it 'The kind is admin' do 
      @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                          kind: :admin, name: 'Matheus', telephone: '(12) 98169-7471', institution_id: 1)       
      expect(@user.kind).to eq('admin')
    end

    it 'The kind is teacher' do   
      @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                          kind: :teacher, name: 'Matheus', telephone: '(12) 98169-7471', institution_id: 1)     
      expect(@user.kind).to eq('teacher')
    end

    it 'The kind is student' do   
      @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                          kind: :student, name: 'Matheus', telephone: '(12) 98169-7471', institution_id: 1)     
      expect(@user.kind).to eq('student')
    end
  end

  context 'validations' do
    it 'is valid' do
      @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                          kind: :student, name: 'Matheus', institution_id: 1)
      expect(@user).to be_valid
    end    

      it 'without email' do
        @user = User.create(password: 'rap007', kind: :student, name: 'Matheus', institution_id: 1)
        expect(@user).to be_invalid
      end         

      it 'without kind' do
        @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                            name: 'Matheus', institution_id: 1)         
        expect(@user).to be_invalid
      end 

      it 'without name' do
        @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                            kind: :student, institution_id: 1)
        expect(@user).to be_invalid
      end 

      it 'without responsavel' do
        @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                            kind: :student, institution_id: 1)
        expect(@user).to be_invalid
      end 

      it 'username has more then 20 characters' do
        @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                            kind: :student, name: 'Matheus', username: (0..20).map { ('a'..'z').to_a[rand(26)] }.join, institution_id: 1)
          expect(@user).to be_invalid
      end 

      it 'name has more then 50 characters' do
        @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                            kind: :student, name: (0..51).map { ('a'..'z').to_a[rand(26)] }.join, institution_id: 1)
        expect(@user).to be_invalid
      end 

      it 'telephone has more then 15 characters' do
        @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                            kind: :student, name: 'Matheus', telephone: (0..16).map { ('a'..'z').to_a[rand(26)] }.join, institution_id: 1)
          expect(@user).to be_invalid
      end 

      it 'minicv has more then 5000 characters' do
        @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                            kind: :student, name: 'Matheus', minicv: (0..5001).map { ('a'..'z').to_a[rand(26)] }.join, institution_id: 1)
          expect(@user).to be_invalid
      end 
      
  end
end
