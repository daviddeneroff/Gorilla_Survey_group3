require_relative '../../spec_helper'

class QuestionSpec
  describe 'question' do
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

    it 'should respond to possible_choices' do
      expect(question.possible_choices.first).to be_a PossibleChoice
    end

    it 'should respond to survey' do
      expect(question.survey).to be_a Survey
    end

  end
end