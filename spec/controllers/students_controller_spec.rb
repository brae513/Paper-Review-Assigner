# spec/controllser/students_controller_spec.rb

require 'rails_helper'
require 'student'

RSpec.describe StudentsController, :type => :controller do

  describe '#update' do
    let(:student) {Student.create(name: "Test",
                                  email: "test@test.edu",
                                  classification: "senior",
                                  paper_history: 1)}
  end
  describe "GET #index" do
    it ''
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
