FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    first_name            {'て'}
    last_name             {'て'}
    first_name_kana       {'テ'}
    last_name_kana        {'テ'}
    birthday              {'1990/1/1'}
  end
end