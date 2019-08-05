get '/events' do
  current_user
  @events = current_user.events.order(:start_at).reverse
  erb :events
end

get '/events/add' do
  erb :add_event
end

get '/events/results' do
  @events = current_user.events.order(:start_at).reverse
  erb :events_results
end

get '/events/:id/edit' do
  @event = Event.find(params[:id])
  erb :edit_event
end

get '/events/:id' do
  @event = Event.find(params[:id])
  @photos = @event.photos
  erb :show_event
end

post '/events' do
  event = Event.new
  event.title = params[:title]
  event.details = params[:details]
  event.start_at = params[:start_at]
  event.end_at = params[:end_at]
  event.user_id = current_user.id
  if event.valid?
    event.save
    redirect '/events'
  else
    @no_title = "You must provide a title"
    erb :add_event
  end
end

put '/events/:id' do
  event = Event.find(params[:id])
  event.title = params[:title]
  event.details = params[:details]
  event.start_at = params[:start_at]
  event.end_at = params[:end_at]
  event.save
  redirect "/events/#{params[:id]}"
end

delete '/events/:id' do
  event = Event.find(params[:id])
  event.delete
  redirect '/events'
end