require 'rails_helper'

describe UsersController do

  let!(:user) { FactoryGirl.create(:user) }

  it { should use_before_filter(:find_user) }

  describe 'GET #show' do

    before do
      get :show, id: user
    end

    it 'assigns requested speaker to user' do
      expect(assigns(:user)).to eq(user)
    end

    it 'render the :show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do

    before do
      get :edit, id: user
    end

    it 'assigns requested user to user' do
      expect(assigns(:user)).to eq(user)
    end

    it 'render the :edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'PUT update' do

    before do
      put :update, id: user
      user.update_attributes(name: 'Frodo')
    end

    it 'asstign the requested user to user' do
      expect(assigns(:user)).to eq(user)
    end

    it 'change user attr' do
      user.reload
      expect(user.name).to eq("Frodo")
    end

    it 'redirect to user_path' do
      expect(response).to redirect_to user_path
    end
  end
end