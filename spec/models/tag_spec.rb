require 'rails_helper'

RSpec.describe Tag, :type => :model do

	context 'validations' do

		it 'must have text' do
			invalid_tag = Tag.create()
			expect(invalid_tag).not_to be_valid
	  	expect(invalid_tag.errors.messages[:text]).to include('A tag must have text')
		end
	  
	  it 'must start with a hash symbol' do
	  	invalid_tag = Tag.create(text: 'baam')
	  	expect(invalid_tag).not_to be_valid
	  	expect(invalid_tag.errors.messages[:text]).to include('A tag must start with a hash symbol')
	  end

	  it 'must be less than 50 characters' do
	  	invalid_tag = Tag.create(text: '#' + 'a'* 51)
	  	expect(invalid_tag).not_to be_valid
	  	expect(invalid_tag.errors.messages[:text]).to include('A tag cannot be longer than 50 characters')
	  end

 	end

end
