require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	describe 'POST #create' do
		context 'with valid attributes' do
			it 'creates the post' do
				post :create, post: attributes_for(:post)
				expect(Post.count).to eq(1)
			end

			it 'redirects to the post show page' do
				post :create, post: attributes_for(:post)
				expect(response).to redirect_to Post.first
			end
		end

		context 'with invalid attributes' do
			it 'does not create a post' do
				post :create, post: attributes_for(:post, title: nil)
				expect(Post.count).to eq(0)
			end

			it 're-renders the "new" view' do
				post :create, post: attributes_for(:post, title: nil)
				expect(response).to render_template :new
			end
		end
	end
end
