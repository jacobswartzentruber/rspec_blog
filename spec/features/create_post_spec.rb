require 'rails_helper'

feature 'User creates a new post' do
	scenario 'with valid attributes' do
		visit new_post_path
		fill_in 'post_title', with: 'My Title'
		fill_in 'post_content', with: 'Content'
		check 'post_published'
		click_on 'Create Post'

		expect(page).to have_content('Show Post')
	end

	scenario 'with invalid attributes' do
		visit new_post_path
		fill_in 'post_title', with: ''
		fill_in 'post_content', with: 'Content'
		check 'post_published'
		click_on 'Create Post'

		expect(page).to have_content('Create a Post')
	end
end