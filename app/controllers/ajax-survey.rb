get '/surveys/new_ajax' do
  erb :'survey/ajax_form'
end

post '/surveys/new_ajax' do
   survey = Survey.create(title: params[:survey_name], user_id: session[:user_id])

  redirect "/surveys/#{survey.id}/edit"
end

get '/surveys/:id/edit' do
  @survey = Survey.find(params[:id])
  erb :'survey/add_questions'
end


post '/surveys/:id/add_questions' do
  question = Question.create(survey_id: params[:id], title: params[:question])
  PossibleChoice.create(question_id: question.id, content: params[:choice1], survey_id: params[:id] )
    PossibleChoice.create(question_id: question.id, content: params[:choice2], survey_id: params[:id] )
  p "yup"
  "Success + #{params}"
end
