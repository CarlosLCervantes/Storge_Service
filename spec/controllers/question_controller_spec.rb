require 'spec_helper'

describe QuestionsController do
  subject (:question) { FactoryGirl.create(:question) }

  context "GET" do
    it "can get list of questions" do
      get :index, format: :json
      data = JSON.parse(response.body)
      expect(data.length).to eq(Question.count)
    end

    it "can get a question" do
      get :show, id: question.id, format: :json
      data = JSON.parse(response.body)
      expect(data["text"]).to eq(question.text)
    end
  end

end