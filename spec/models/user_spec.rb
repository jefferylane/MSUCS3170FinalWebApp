# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do
    it 'is valid with a valid username' do
      subject.username = 'validusername'
      expect(subject).to be_valid
    end

    it 'is not valid without a username' do
      subject.username = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:username]).to include("can't be blank")
    end

    it 'is not valid with a blank username' do
      subject.username = ''
      expect(subject).not_to be_valid
      expect(subject.errors[:username]).to include("can't be blank")
    end

    # Add more tests for other username validations if needed
  end
end