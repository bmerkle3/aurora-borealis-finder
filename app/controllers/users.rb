get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/login' do
  erb :"users/login"
end

post '/users/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 422
    @errors = ['Email or password entered incorrectly']
    erb :'/users/login'
  end
end

delete '/logout' do
   session[:user_id] = nil
   redirect '/'
end

#protect so only user_id of user who is logged in can be viewed
get '/users/:id' do
  if current_user
    @user = User.find_by(id: params[:id])
    if @user && current_user.id == @user.id
      erb :'users/show'
    else
      redirect "/users/#{current_user.id}"
      erb :'404'
    end
  end
end
