# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @comment = build(:comment)
    expect(@comment).to be_valid
  end

  context 'validation tests' do
    it 'should have a valid content' do
      expect(build(:comment, content: nil)).not_to be_valid
    end
  end
end
