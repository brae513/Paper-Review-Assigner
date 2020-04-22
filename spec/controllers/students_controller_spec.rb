# spec/controllser/students_controller_spec.rb

require 'rails_helper'
require 'student'

describe StudentsController do
  describe 'update student info' do
    it 'should change the information that is updated'
    it 'should call the model method that performs update'
    it 'should confirm the information was updated'
    it 'should send the user to the updated screen'
  end
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
