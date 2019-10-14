require 'rails_helper'

RSpec.describe SubReddit, type: :model do

    before(:all) do
        @sub_reddit = create(:sub_reddit)
    end
    it 'sub_reddit is a valid model' do
        expect(@sub_reddit).to be_valid
    end
end
