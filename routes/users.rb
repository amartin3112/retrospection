get '/users' do
    erb :add_user
end

get '/users/:id/edit' do
    erb :edit_user
end

get '/users/:id/edit_password' do
    erb :edit_password
end

post '/users' do
    user = User.new
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.password = params[:password]
    if user.valid?
        user.save
        redirect '/'
    else
        redirect '/users'
    end
end

put '/users/:id/password' do
    user = User.find(params[:id])
    if user.authenticate(params[:current_password])
        user.password = params[:password]
        if user.valid?
            user.save
            @successful = "Your password was successfully updated"
            erb :edit_user
            # redirect "/users/#{user.id}/edit"
        else
            @invalid_password = "Your new password must be at least 8 characters"
            erb :edit_password
            # redirect "/users/#{user.id}/edit_password"
        end
    else
        @invalid_password = "The current password you provided was incorrect"
        erb :edit_password
        # redirect "/users/#{user.id}/edit_password"
    end
end

put '/users/:id' do
    user = User.find(params[:id])
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.save
    redirect '/events'
end