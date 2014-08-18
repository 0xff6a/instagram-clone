def _create_example_pic
	Rack::Test::UploadedFile.new(Rails.root.join('spec/images/example.jpg'), 'image/jpg')
end