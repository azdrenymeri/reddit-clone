# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = create(:user)
  end

  it 'is a valid model with valid attributes' do
    expect(@user).to be_valid
  end

  context 'validation tests' do
    it 'is not valid without an email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end
    it 'is not valid without password' do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
    end
    it 'is not valid without full name' do
      user = build(:user, full_name: nil)
      expect(user).not_to be_valid
    end
    it 'is not valid without birth date' do
      user = build(:user, birth_date: nil)
      expect(user).not_to be_valid
    end
  end
end
