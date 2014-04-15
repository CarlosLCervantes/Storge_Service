# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
    f.first_name "Testy"
    f.last_name "McTest"
    f.email "tesymctest@mailinator.com"
    f.phone "(123)123-1234"
    f.password "123456"
    f.password_confirmation "123456"
    factory :me do |m|
      m.first_name "Carlos"
      m.last_name "Cervantes"
      m.email "ccer562@yahoo.com"
      m.phone "(562)652-4297"
    end
  end
end
