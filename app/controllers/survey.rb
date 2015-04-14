after do
ActiveRecord::Base.connection.close
end

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

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'survey/survey'
end

post "/surveys/:id" do
  params[:hello].each {|key, opts| Vote.create(possible_choice_id: opts) }
  redirect "/surveys"
end

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
  redirect "user/#{current_user.id}"
end

# get 'survey/:id/edit' do
#   erb :'survey/survey_form'
# # end

# <form action="/survey/<%=survey.id%>/update" method= "POST">
#   <input type="hidden" name="_method" value="put">
#   <input type="submit" value="Update Survey">


