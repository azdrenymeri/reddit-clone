# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubReddit, type: :model do
  before(:all) do
    @sub_reddit = create(:sub_reddit)
  end

  it 'sub_reddit is a valid model' do
    expect(@sub_reddit).to be_valid
  end

  context 'validation tests' do
    it 'is not valid without a title' do
        sub_reddit = build(:sub_reddit, title: nil)
        expect(sub_reddit).not_to be_valid
    end
    it 'is not valid without a description' do 
        sub_reddit = build(:sub_reddit, description: nil)
        expect(sub_reddit).not_to be_valid
    end
  end
end
