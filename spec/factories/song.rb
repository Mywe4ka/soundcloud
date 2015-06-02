# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title "MyString"
    artist "MyString"
    year Time.now
    mfile File.new(Rails.root + 'spec/factories/songs/Death_Grips.mp3')
    album "Hello"
    track_nr 1
    genre "Rock"
    user { FactoryGirl.create(:user) }
  end
end
