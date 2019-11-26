require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
   describe "questions#new action" do
    it "should successfully run new" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "questions#create action" do
    it "should successfully create a new question in our database" do
      post :create, params: { question: { question: 'Hello!' } }
      expect(response).to redirect_to "/games/userpage"
    end
  end
end