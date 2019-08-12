get '/photos' do
    @photos = current_user.photos.order(:timestamp).reverse
    erb :photos
  end
  
  get '/photos/add' do
    @messages = []
    erb :add_photo
  end
  
  get '/photos/:id' do
    @photo = Photo.find(params[:id])
    @events = current_user.events.order(:title)
    erb :show_photo
  end
  
  post '/photos' do
    photo = Photo.new
    photo.image_url = params[:image_url]
    photo.timestamp = Time.now # use timestamp from photo
    photo.user_id = current_user.id
    # photo.event_id # optional
    if photo.save
      redirect '/photos'
    else
      @messages = photo.errors.full_messages
      erb :add_photo
    end
  end

  put '/photos/:id' do
    photo = Photo.find(params[:id])
    photo.event_id = params[:event_id].to_i
    photo.save
    redirect "/photos/#{photo.id}"
  end
  
  delete '/photos/:id' do
    photo = Photo.find(params[:id])
    photo.delete
    redirect '/photos'
  end