# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Post.destroy_all
Tag.destroy_all


def _create_pic(filepath)
	Rack::Test::UploadedFile.new(Rails.root.join(filepath), 'image/jpeg')
end

user1 = User.create(email: 'me@instabaam.com', password:'12345678', password_confirmation: '12345678')  

p1 = _create_pic('spec/images/apple.jpeg')
p2 = _create_pic('spec/images/boom.jpeg')
p3 = _create_pic('spec/images/example.jpeg')
p4 = _create_pic('spec/images/pineapple.jpeg')
p5 = _create_pic('spec/images/take-that-berries.jpeg')

Post.create(title: 'This keeps the doctor away', picture: p1, user_id: user1.id, tag_list: '#h8apples', location: 'Spitalfields, London, UK')
Post.create(title: 'Disliking fruit', picture: p2, user_id: user1.id, tag_list: '#slomo, #2500fps', location: 'Bermondsey, London, UK')
Post.create(title: 'Exotic', picture: p3, user_id: user1.id, tag_list: '#holidaysnaps, #slomo', location: 'Bangkok, Thailand')
Post.create(title: 'Spikes not helping...', picture: p4, user_id: user1.id, tag_list: '#h8pineapples', location: 'Brussels, Belgium')
Post.create(title: 'Fruit salad', picture: p5, user_id: user1.id, tag_list: '#takethatberries, #2500fps', location: 'Shoreditch, London, UK')

