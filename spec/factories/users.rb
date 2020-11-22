FactoryBot.define do
  factory :user do
    nickname              { 'テスト' }
    email                 { 'zzz@zzz.com' }
    password              { '123456ky' }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
  end
end
