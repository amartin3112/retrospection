get '/photos' do
    @photos = Photo.all.where(user_id: current_user).order(:timestamp).reverse
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
    photo.user_id = current_user.id
    # photo.event_id # optional
    photo.save
    redirect '/photos/add'
  end
  
  delete '/photos/:id' do
    photo = Photo.find(params[:id])
    photo.delete
    redirect '/photos'
  end