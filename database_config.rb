require 'active_record'

options = {
    adapter: 'postgresql',
    database: 'retrospection'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)