# require 'pry' if development?
require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'database_config'

require_relative 'models/user'
require_relative 'models/event'
require_relative 'models/photo'

enable :sessions

helpers do
  def current_user
    current_user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :index
end

require_relative 'routes/events'
require_relative 'routes/photos'
require_relative 'routes/sessions'
require_relative 'routes/users'