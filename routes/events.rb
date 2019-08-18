get '/events' do
  current_user
  @events = current_user.events.order(:start_at).reverse
  erb :events
end

get '/events/add' do
  @messages = []
  @event = Event.new
  @event.start_at = Date.today
  @event.end_at = Date.today
  erb :add_event
end

get '/events/results' do
  @events = current_user.events.order(:start_at).reverse
  erb :events_results
end

get '/events/:id/edit' do
  @messages = []
  @event = Event.find(params[:id])
  erb :edit_event
end

get '/events/:id' do
  @event = Event.find(params[:id])
  @photos = @event.photos
  erb :show_event
end

post '/events' do
  @event = Event.new
  @event.title = params[:title]
  @event.details = params[:details]
  @event.start_at = params[:start_at]
  @event.end_at = params[:end_at]
  @event.user_id = current_user.id
  if @event.save
    redirect '/events'
  else
    if @event.start_at == nil
      @event.start_at = Date.today      
    end
    if @event.end_at == nil
      @event.end_at = Date.today      
    end
    @messages = @event.errors.full_messages
    erb :add_event
  end
end

put '/events/:id' do
  @event = Event.find(params[:id])
  @event.title = params[:title]
  @event.details = params[:details]
  @event.start_at = params[:start_at]
  @event.end_at = params[:end_at]
  if @event.save
    redirect "/events/#{params[:id]}"
  else
    if @event.start_at == nil
      @event.start_at = Date.today      
    end
    if @event.end_at == nil
      @event.end_at = Date.today      
    end
    @messages = @event.errors.full_messages
    erb :edit_event
  end
end

delete '/events/:id' do
  event = Event.find(params[:id])
  event.photos.each do |photo|
    photo.event_id = nil
    photo.save
  end
  event.destroy
  redirect '/events'
end