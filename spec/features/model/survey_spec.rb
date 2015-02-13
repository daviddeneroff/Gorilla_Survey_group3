require_relative '../../spec_helper'

class SurveySpec
  describe 'survey' do
    let(:user) { User.create(username: 'monky', email: "monky@gmail.com", password: "123", password_confirmation: "123")}
    let(:survey) { Survey.create(title: "Best Cat Survey", user_id: user.id)}
    let(:question) { Question.create(survey_id: survey.id, title: "What is the best Cat?")}
    let(:choice) { PossibleChoice.create(question_id: question.id, content: "Black Cat", survey_id: survey.id)}

    before do
      user
      survey
      question
      choice
    end

    it 'should respond to questions' do
      expect(survey.questions.first).to be_a Question
    end

    it 'should respond to user' do
      expect(survey.user).to be_a User
    end

  end
end