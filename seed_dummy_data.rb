require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/event'


# create a couple of users

user = User.new
user.first_name = "Ashley"
user.last_name = "Martin"
user.email = "am@ga.co"
user.password = "test"
user.save

user = User.new
user.first_name = "D"
user.last_name = "T"
user.email = "dt@ga.co"
user.password = "test"
user.save


# create some events for testing

event = Event.new
event.title = "1 - old event"
event.details = "Lorem ipsum dolor amet tumblr pitchfork listicle chambray helvetica tbh mlkshk street art af skateboard 3 wolf moon tumeric tacos."
event.start_at = "2019-05-20"
event.end_at = event.start_at
event.save

event = Event.new
event.title = "2 - more than one day"
event.details = "Yr vinyl fashion axe chambray keytar everyday carry scenester schlitz listicle bitters forage sustainable. Chillwave prism taiyaki, hammock salvia locavore viral ramps vaporware enamel pin. Sartorial typewriter tattooed art party fam beard hashtag seitan snackwave post-ironic irony letterpress. Williamsburg marfa blog, paleo etsy intelligentsia food truck slow-carb twee snackwave. Hashtag lumbersexual normcore yuccie, semiotics hexagon messenger bag schlitz gochujang pork belly shaman hot chicken literally you probably haven't heard of them 8-bit."
event.start_at = "2019-07-16"
event.end_at = "2019-07-23"
event.save

event = Event.new
event.title = "3 - same day 1/2"
event.details = "Pinterest prism raclette, selfies palo santo kickstarter man bun organic adaptogen you probably haven't heard of them poutine scenester biodiesel forage intelligentsia."
event.start_at = "2019-08-01"
event.end_at = "2019-08-01"
event.save

event = Event.new
event.title = "4 - same day 2/2"
event.details = "Farm-to-table green juice activated charcoal, keffiyeh mlkshk drinking vinegar ugh hella tumeric tote bag kickstarter flexitarian pour-over DIY."
event.start_at = "2019-08-01"
event.end_at = "2019-08-01"
event.save

event = Event.new
event.title = "5 - future"
event.details = "Lorem ipsum dolor amet tumblr pitchfork listicle chambray helvetica tbh mlkshk street art af skateboard 3 wolf moon tumeric tacos."
event.start_at = "2019-09-12"
event.end_at = "2019-09-12"
event.save

# creted new event that will be owned by someone else

event = Event.new
event.title = "6 - someone elses event"
event.details = "Fashion axe blue bottle forage kickstarter cronut microdosing hot chicken iPhone helvetica."
event.start_at = "2019-07-29"
event.end_at = "2019-07-29"
event.save


# create some photos for testing

# owned by me and associated to "3 - same day 1/2"
photo = Photo.new
photo.image_url = "https://i.imgur.com/vE64RCu.jpg"
photo.timestamp = "2019-08-01"
photo.user_id = 1
photo.event_id = 55
photo.save

# another photo on "3 - same day 1/2"
photo = Photo.new
photo.image_url = "https://i.imgur.com/NgAlhok.jpg"
photo.timestamp = "2019-08-01"
photo.user_id = 1
photo.event_id = 55
photo.save

# not associated with an event
photo = Photo.new
photo.image_url = "https://i.imgur.com/0er5tYV.jpg"
photo.timestamp = "2019-07-10"
photo.user_id = 1
photo.save

# owned by someone else and associated to one of their events
photo = Photo.new
photo.image_url = "https://i.imgur.com/GqRzs0E.jpg"
photo.timestamp = "2019-08-01"
photo.user_id = 2
photo.event_id = 58
photo.save

# owned by someone else and not associated to an event
photo = Photo.new
photo.image_url = "https://i.imgur.com/olfB1pU.jpg"
photo.timestamp = "2019-08-01"
photo.user_id = 2
photo.save