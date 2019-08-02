get '/photos' do
    @photos = Photo.all.order(:timestamp).reverse
    erb :photos
  end
  
  get '/photos/add' do
    erb :add_photo
  end
  
  get '/photos/:id' do
    @photo = Photo.find(params[:id])
    erb :show_photo
  end
  
  post '/photos' do
    photo = Photo.new
    photo.image_url = params[:image_url]
    photo.timestamp = Time.now # use timestamp from photo
    photo.user_id = 1 # need to make this dynamic
    # photo.event_id # optional
    photo.save
    redirect '/photos/add'
  end
  
  delete '/photos/:id' do
    photo = Photo.find(params[:id])
    photo.delete
    redirect '/photos'
  end