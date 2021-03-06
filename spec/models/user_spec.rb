require 'spec_helper'

describe User do

  let!(:user) { FactoryGirl.create(:user) }

  subject { user }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:provider) }
  it { should respond_to(:uid) }
  it { should respond_to(:city) }
  it { should respond_to(:country) }
  it { should respond_to(:description) }
  it { should respond_to(:aasm_state) }
  it { should respond_to(:oauth_token) }
  it { should respond_to(:oauth_expires_at) }
  it { should respond_to(:photo) }
  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:followers) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }
  it { should respond_to(:unfollow!) }
  it { should respond_to(:guru!) }
  it { should respond_to(:melo!) }
  it { should respond_to(:green!) }


  it { should have_many(:songs) }
  it { should have_many(:playlists) }

  it 'name return users full name' do
    user = FactoryGirl.build(:user)
    expect( user.name ).to eq(user.first_name.to_s + ' ' + user.last_name.to_s)
  end

  describe "following/follower functionality" do
    let!(:other_user) { FactoryGirl.create(:user) }
    before do
      user.follow!(other_user)
    end

    context "following user" do
      it { should be_following(other_user) }
      its(:followed_users) { should include(other_user) }
    end

    context "followed user" do
      subject { other_user }
      its(:followers) { should include(user) }
    end

    context "unfollowing" do
      before { user.unfollow!(other_user) }

      it { should_not be_following(other_user) }
      its(:followed_users) { should_not include(other_user) }
    end
  end

  describe 'AASM states' do
      it 'should be an initial state' do
        user.should be_greenman
      end

      it 'should change to :guruman on :guru' do
        user.guru!
        user.should be_guruman
      end

      it 'should change to :greenman on :green' do
        user.green!
        user.should be_greenman
      end

      it 'should change to :meloman on :melo' do
        lambda {user.melo!}.should raise_error(AASM::InvalidTransition)
      end

      ['guru!', 'green!', 'melo!'].each do |action|
        it "should raise an error for #{action}" do
          lambda {@song.send(action)}.should raise_error(NoMethodError)
        end
      end
  end
end