get '/users' do
    @messages = []
    erb :add_user
end

get '/users/:id/edit' do
    @messages = []
    erb :edit_user
end

get '/users/:id/edit_password' do
    @messages = []
    erb :edit_password
end

post '/users' do
    user = User.new
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.password = params[:password]
    if user.save
        redirect '/'
    else
        @messages = user.errors.full_messages
        erb :add_user
    end
end

put '/users/:id/password' do
    user = User.find(params[:id])
    if user.authenticate(params[:current_password])
        user.password = params[:password]
        if user.save
            @messages = []
            @successful = "Your password was successfully updated"
            erb :edit_user
        else
            @messages = user.errors.full_messages
            erb :edit_password
        end
    else
        @messages = ["Current password is incorrect"]
        erb :edit_password
    end
end

put '/users/:id' do
    user = User.find(params[:id])
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    if user.authenticate(params[:password])
        user.password = params[:password]
        if user.save
            @messages = []
            @successful = "Your details were successfully updated"
            erb :edit_user
        else
            @messages = user.errors.full_messages
            erb :edit_user
        end
    else
        @messages = ["Incorrect password"]
        erb :edit_user
    end
end