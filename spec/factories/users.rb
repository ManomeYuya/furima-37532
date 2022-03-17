FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'a00000'}
    password_confirmation {'a00000'}
    first_name            {'て'}
    last_name             {'て'}
    first_name_kana       {'テ'}
    last_name_kana        {'テ'}
    birthday              {'1990/1/1'}
  end
end