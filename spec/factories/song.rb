# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title "MyString"
    artist "MyString"
    year Time.now
    mfile { File.new("#{Rails.root}/public/system/songs/mfiles/000/000/004/original/Death_Grips_-_I've_Seen_Footage.mp3") }
    album "Hello"
    track_nr 1
    genre "Rock"
  end
end
