def _create_post(title, filepath)
	visit posts_path
	click_link 'New Post'
	fill_in 'Title', with: title
	attach_file 'Picture', Rails.root.join(filepath)
	click_button 'Post'
end