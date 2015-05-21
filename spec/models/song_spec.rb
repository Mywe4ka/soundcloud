require 'rails_helper'

describe Song do

  let(:song) { FactoryGirl.create(:song) }

  subject { song }

  it { should be_valid }
  it { should respond_to(:title) }
  it { should respond_to(:artist) }
  it { should respond_to(:year) }
  it { should belong_to(:user) }

end
