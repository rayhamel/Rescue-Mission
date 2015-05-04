FactoryGirl.define do
  factory :question do
    sequence(:title) do |n|
      "#{n} things I need answered, pronto, which means right now!"
    end
    description 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed' \
      ' do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut ' \
      'enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ' \
      'ut aliquip ex ea commodo consequat.'
  end

  factory :answer do
    question
    sequence(:description) do |n|
      "#{n} different people have tried this answer and it worked for everyone."
    end
  end
end
