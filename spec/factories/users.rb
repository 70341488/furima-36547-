FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'g4' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {'中山'}
    family_name {'祐輔'}
    first_name_kana {'ナカヤマ'}
    family_name_kana {'ユウスケ'}
    birth_date {'1985-08-13'}
  end
end