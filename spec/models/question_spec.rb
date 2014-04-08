require 'spec_helper'

describe Question do
  let(:question) { FactoryGirl.create(:question) }
  it "can create question" do
    expect(question).to_not be_nil
  end

  it "can add option to quesiton" do
    #question.options << Option.create(text: "Ima derp")
    expect(question.options.count).to eq(0)
    question.options.create(text: "Ima derp")
    expect(question.options.count).to eq(1)
  end

  it "can create question with options" do
    new_question = FactoryGirl.create(:question_with_options) #make sure association exisys
    expect(new_question.options.count).to eq(5)
  end
end
