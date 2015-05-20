require 'rails_helper'

describe Song do

it 'has valid factory' do
    expect(FactoryGirl.create(:song)).to be_valid
  end

end
