get '/user' do
  @survey = Survey.where(user_id: current_user.id)
  erb :'survey/user_profile'
end

get '/surveys' do
  @surveys = Survey.all
  erb :'survey/all_surveys'
end

get '/surveys/new' do
  erb :'survey/survey_form'
end

post '/surveys/new' do
  Survey.create(params)
  redirect '/user'
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'survey/survey'
end

post "/surveys/:id" do
  # @survey = Survey.find(params[:id])
  p params
  redirect "/yolo"
end


get 'survey/:id/edit' do
  erb :'survey/survey_form'
end




