get '/events' do
    @events = Event.all.order(:start_at).reverse
    erb :events
  end
  
  get '/events/add' do
    erb :add_event
  end

  get '/events/:id' do
    @event = Event.find(params[:id])
    erb :show_event
  end

  post '/events' do
    event = Event.new
    event.title = params[:title]
    event.details = params[:details]
    event.start_at = params[:start_at]
    event.end_at = params[:end_at]
    event.save
    redirect '/events'
  end