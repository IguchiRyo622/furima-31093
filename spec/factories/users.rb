FactoryBot.define do
  factory :user do
    neckname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"abc123"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_day             {"1930-01-01"}
  end
end