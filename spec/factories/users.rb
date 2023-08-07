FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000'}
    password_confirmation {password}
    last_name             { '田中' }
    first_name            { '太郎' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birthday              { Date.new(2000, 1, 1) }
  end
end