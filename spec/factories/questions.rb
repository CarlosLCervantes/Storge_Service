# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do |f|
    f.text "How many sexual partners have you had?"
    factory :question_with_options do |f|
      ignore do
        options_count 5
      end

      after(:create) do |question, evaluator|
        create_list(:option, evaluator.options_count, question: question)
      end
    end
  end
end
