require 'rails_helper'

describe SongsController do

  let!(:song) { FactoryGirl.create(:song) }

  subject { song }

  describe 'GET #edit' do

    before do
      song.artist = 'Frodo'
      get :edit, id: song
    end

    it 'assigns requested song to song' do
      expect(assigns(:song)).to eq(song)
    end

    it 'render the :edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'PUT update' do

    before do
      song.artist = 'Frodo'
      put :update, id: song
    end

    it 'assign the requested song to @song' do
      expect(assigns(:song)).to eq(song)
    end

    it 'change @song attr' do
      expect(song.artist).to eq("Frodo")
    end

    it 'redirect to songs_path' do
      expect(response).to redirect_to songs_path
    end
  end

  describe 'DELETE #destroy' do

    it 'delete the song' do
      expect{delete :destroy, id: song}.to change(Song, :count).by(-1)
    end

    it 'redirect to songs#index' do
      delete :destroy, id: song
      expect(response).to redirect_to songs_path
    end
  end
end