get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :individual_survey
end
