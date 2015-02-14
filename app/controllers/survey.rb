get '/user/:id' do
  @user = User.find(params[:id])
  @surveys = Survey.where(user_id: params[:id])
  erb :'survey/user_profile'
    if @user.id == session[:user_id]
      erb :'survey/user_profile'
    else
      redirect '/login'
    end
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

# post "/surveys/:id" do
#   # @survey = Survey.find(params[:id])
#   p params
#   redirect "/surveys"
# end

delete '/survey/:id/delete'do
  survey = Survey.find(params[:id])
  survey.destroy
  redirect back
end

get '/survey/:id/update' do
  @survey = Survey.find(params[:id])
  erb :'survey/update_survey_form'
end

put '/survey/:id/update' do
  Survey.update(params[:id], {:title => params[:title]})
  redirect back
end

# get 'survey/:id/edit' do
#   erb :'survey/survey_form'
# # end

# <form action="/survey/<%=survey.id%>/update" method= "POST">
#   <input type="hidden" name="_method" value="put">
#   <input type="submit" value="Update Survey">


