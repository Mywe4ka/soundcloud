FactoryGirl.define do
  factory :user do |t|
    t.provider "facebook"
    t.uid "123456"
    t.name "Terry Kerry"
    t.first_name "Terry"
    t.last_name "Kerry"
    t.city "CodeAcademy"
    t.country "CodingCountry"
    t.description "Developer. A little."
    t.oauth_token "12345"
    t.oauth_expires_at Time.now + 1.week
  end
end