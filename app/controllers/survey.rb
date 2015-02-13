get '/user/:id' do
  @user = User.find(params[:id])
  @surveys = Survey.where(user_id: params[:id])

get '/user' do
  @survey = Survey.where(user_id: current_user.id)
  erb :'survey/user_profile'
end

get '/surveys' do
  @surveys = Survey.all
  erb :'survey/all_surveys'
end

get '/surveys/new' do
  erb :'survey/question_form'
end

get '/surveys/new/2' do
  @count = params[:num_questions].to_i
  erb :'survey/choices_form'
end

post '/surveys/new' do
  # {"survey_name"=>"test this one", "question"=>{"0"=>"number one", "1"=>"question 2", "2"=>"question"}, "choice1"=>{"0"=>"a1 q1", "1"=>"a1 q 2", "2"=>"a1 a3"}, "choice2"=>{"0"=>"a2 q1", "1"=>"a1 q2", "2"=>"a2 q 3"}}
  # use params to make a survey object with qs and pas
  Survey.create(title: params[:survey_name], user_id: current_user.id)

  redirect '/surveys'
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'survey/survey'
end

post "/surveys/:id" do
  # @survey = Survey.find(params[:id])
  p params
  redirect "/surveys"
end


# get 'survey/:id/edit' do
#   erb :'survey/survey_form'
# end




