get '/users' do
    erb :add_user
end

post '/users' do
    user = User.new
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.password = params[:password]
    user.save
    redirect '/'
end