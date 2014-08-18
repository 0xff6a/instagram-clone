def _create_example_pic
	Rack::Test::UploadedFile.new(Rails.root.join('spec/images/example.jpg'), 'image/jpg')
end

def _create_test_user_object
	User.create(email: 'test@test.com', password: '12345678', password_confirmation:'12345678')
end