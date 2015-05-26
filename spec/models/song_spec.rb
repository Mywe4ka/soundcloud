require 'rails_helper'

describe Song do

  let(:song) { FactoryGirl.create(:song) }

  subject { song }

  it { should be_valid }
  it { should respond_to(:title) }
  it { should respond_to(:artist) }
  it { should respond_to(:year) }
  it { should respond_to(:album) }
  it { should respond_to(:track_nr) }
  it { should respond_to(:genre) }
  it { should respond_to(:mfile) }

  it { should belong_to(:user) }

  it { should have_attached_file(:mfile) }
  it { should validate_attachment_presence(:mfile) }
  it { should validate_attachment_content_type(:mfile).
                allowing("audio/mpeg", "audio/mp3").
                rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:mfile).
                less_than(10.megabytes) }

end
