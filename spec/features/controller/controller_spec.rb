require_relative '../../spec_helper'

class UserSpec
  describe 'users' do
    let(:user) { User.create(username: 'monky', email: "monky@gmail.com", password: "123", password_confirmation: "123")}

    before do
      user
    end

    it 'should respond to /surveys' do
      get '/surveys'
      expect(last_response).to be_ok
      expect(last_response.body).to include 'monky'
    end

    # xit 'should respond to /squirrles/new' do
    #   get '/squirrels/new'
    #   expect(last_response).to be_ok
    #   expect(last_response.body).to include 'add'
    # end

    # xit 'should respond to /squirrels/:id' do
    #   get "/squirrels/#{squirrel.id}"
    #   expect(last_response).to be_ok
    #   expect(last_response.body).to include 'update'
    #   expect(last_response.body).to include 'Rockey'
    # end

    # xit 'should respond to /squirrels/create' do
    #   post '/squirrels/create', params={ squirrel: {name: 'Scott Summers', tree_mail: 'cyclops@xmen.com', tail_length: 412}}
    #   expect(last_response).to be_redirect
    #   follow_redirect!
    #   expect( last_response.body).to include 'update'
    #   expect( last_response.body).to include 'Scott Summers'
    # end
  end
end