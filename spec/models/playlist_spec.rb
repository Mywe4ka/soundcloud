require 'rails_helper'

describe Playlist do

  let(:playlist) { FactoryGirl.create(:playlist) }

  subject { playlist }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:user) }

  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:songs) }

end
