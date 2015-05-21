require 'rails_helper'

describe Song do

  before do
    @song = FactoryGirl.create(:song)
  end

  subject { @song }

  it { should respond_to(:title) }
  it { should respond_to(:artist) }
  it { should respond_to(:year) }

  it { should have_and_belong_to_many(:users) }

  it 'has valid factory' do
    expect(FactoryGirl.create(:song)).to be_valid
  end
end
