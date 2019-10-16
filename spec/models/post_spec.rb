require 'rails_helper'

RSpec.describe Post, type: :model do

    before(:all) do 
        @post = create(:post)
        expect(@post).to be_valid
    end

    context 'validation tests' do
        it 'should have a valid title' do 
        expect(build(:post, title: nil)).not_to be_valid
        end 
        it 'should have a valid content' do
            expect(build(:post, content: nil)).not_to be_valid
        end
    end
end
