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