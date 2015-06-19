require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe 'start_following' do
    let!(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.start_following(user.id) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Starting following new user')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['from@example.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.name)
    end
  end

  describe 'stop_following' do
    let!(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.stop_following(user.id) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Stopping following the user')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['from@example.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.name)
    end
  end

  describe 'notify_followers' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:song) { FactoryGirl.create(:song) }
    let(:mail) { UserMailer.notify_followers(user.id, song.id) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Following user added new song')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['from@example.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.name)
    end

    it 'assigns @confirmation_url' do
      expect(mail.body.raw_source).to match(/http:\/\/localhost:3000\/songs\/comments\?id=#{song.id}/)
    end
  end
end
