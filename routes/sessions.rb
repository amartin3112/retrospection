post '/sessions' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/events"
    else
        @message = "Invalid email or password"
        erb :index
    end
end

delete '/sessions' do
    session[:user_id] = nil
    redirect "/"
end