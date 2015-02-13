get '/' do
  redirect '/login'
end

get '/login' do
  erb :login
end

post '/login' do
  if @user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    redirect "/posts"
  else
    404
  end
end
