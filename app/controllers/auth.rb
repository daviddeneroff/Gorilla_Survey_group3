get '/' do
 
    erb :home, :layout => :"home_layout"


end

get '/login' do
  erb :'login/login'
end

post '/login' do
  if @user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
    p @user
    p @user.id
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    redirect '/'
  end
end

post '/signup' do
  @user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  if @user.username
    session[:user_id] = @user.id
    redirect '/login'
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end
