require 'rails_helper'

describe PlaylistsController do

  let!(:playlist) { FactoryGirl.create(:playlist) }
  let(:song) { FactoryGirl.create(:song) }

  subject { playlist }

  describe 'POST #create' do

    context 'with valid parameters' do

      it 'save new playlist to DB' do
        expect{ post :create, playlist: FactoryGirl.attributes_for(:playlist)
          }.to change(Playlist, :count).by(1)
      end

      it 'redirect to playlists_path' do
        post :create, playlist: FactoryGirl.attributes_for(:playlist)
        expect(response).to redirect_to playlists_path
      end
    end

    context 'with invalid attr' do
      it 'doesn\'t save new playlist to DB' do
        expect{ post :create, playlist: FactoryGirl.attributes_for(:playlist, name: nil)}.not_to change(Playlist, :count)
      end

      it 're-render :new template' do
        post :create, playlist: FactoryGirl.attributes_for(:playlist, name: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do

    before do
      playlist.name = 'Rock'
      get :edit, id: playlist
    end

    it 'assigns requested playlist to playlist' do
      expect(assigns(:playlist)).to eq(playlist)
    end

    it 'render the :edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do

    before do
      playlist.name = 'Frodo'
      put :update, id: playlist
    end

    it 'assign the requested playlist to playlist' do
      expect(assigns(:playlist)).to eq(playlist)
    end

    it 'change playlist attr' do
      expect(playlist.name).to eq("Frodo")
    end

    it 'redirect to playlist_path' do
      expect(response).to redirect_to playlist_path
    end
  end

  describe 'DELETE #destroy' do

    it 'delete the playlist' do
      expect{delete :destroy, id: playlist}.to change(Playlist, :count).by(-1)
    end

    it 'redirect to playlists#index' do
      delete :destroy, id: playlist
      expect(response).to redirect_to playlists_path
    end
  end

  describe 'GET #add_song' do
    before do
      @params = {:song_id => song.id, id: playlist}
    end

    it 'add song to playlist' do
      expect{ get :add_song , @params }.to change(playlist.songs, :count).by(1)
    end
  end
end