def _create_example_pic
	Rack::Test::UploadedFile.new(Rails.root.join('spec/images/example.jpeg'), 'image/jpeg')
end

def _create_test_user_object
	User.create(email: 'test@test.com', password: '12345678', password_confirmation:'12345678')
end

def _create_and_login_test_user
	test_user = _create_test_user_object
	login_as test_user
end

def _create_test_post_object
	Post.create(title: 'test post', picture: _create_example_pic, user_id: User.first.id)
end