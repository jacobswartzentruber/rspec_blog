require 'rails_helper'

RSpec.describe Post, type: :model do

  it "has a valid factory" do
  	expect(build(:post)).to be_valid
  end

  it "is invalid without a title" do
  	expect(build(:post, title: nil)).to_not be_valid
  end

  it "is invalid without content" do
  	expect(build(:post, content: nil)).to_not be_valid
  end

  it "is unpublished when created" do
  	expect(build(:post).published).to eq(false)
  end

end
