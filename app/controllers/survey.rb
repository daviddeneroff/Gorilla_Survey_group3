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
  questions = params[:question]
  new_survey = Survey.create(title: params[:survey_name], user_id: current_user.id)
    questions.each do |key, question|
      new_question = Question.create(survey_id: new_survey.id, title:question)
        PossibleChoice.create(question_id: new_question.id, content: params[:choice1][key], survey_id: new_survey.id)
        PossibleChoice.create(question_id: new_question.id, content: params[:choice2][key], survey_id: new_survey.id)
    end


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




