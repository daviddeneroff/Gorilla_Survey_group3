get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :individual_survey
end

post "/surveys/:id" do
  # @survey = Survey.find(params[:id])
  p params
  redirect "/yolo"
end
