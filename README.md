Week 9 @ Makers Academy: Instagram Clone (InstaBAAM!)
=====================================================

Hosted on heroku @ http://salty-brook-7264.herokuapp.com/

Ruby Version
------------

Ruby 2.1.2

Technologies used:
------------------
- Ruby on Rails
- Javascript
- jQuery & jQuery UI
- RSpec & Capybara for testing ruby components
- Poltergeist/Phantom JS for testing JavaScript components
- Bootstrap for styling & modals
- GMaps API for mapping functionality
- Postgres DB

Functionality:
--------------
- Homepage displays a list of posts
- Each post has a title, attached image, tags and location
- Users can sign up to the site to post their own images
- Clicking on a post image will take the user through to the full size image
- Clicking on a post location will take a user through to a location map
- Clicking on a post tag will display only posts that share the tag on the page
- Clicking on the new post button will pop up a modal for users to add posts. Clicking on the mini map will autopopulate the location field. The minimap geolocates the user automatically, but can be recentred to a different location
- All models are fully validated

TO DO
------

- Add purchases model
- purchases post_id 
- user has many purchases
- purchase belong_to user
- Add post.has_been_purchased_by?(user)
- if yes can see full size image
- if no get message explaining they need to purchase

Notes:
------
- GMaps API was used to generate all map functionality. This is easier to use than Google Maps for simple functionality, but proved a problem for testing as GMaps does not allow us to select an individual marker on which to trigger a click event. No solution found to test the more complex map functionality.

Running the application:
------------------------
- bin/rails server in CLI will open the app on port 3000
- rspec in CLI from the root directory will run the test suite
- bin/rake db:seed will seed the database with sample entries to demonstrate functionality

