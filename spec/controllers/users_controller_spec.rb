# frozen_string_literal: true

RSpec.describe UsersController, type: :controller do
  describe 'GET public' do
    it 'renders the expected view for public' do
      get :public, params: { id: 99 }
      expect(response).to render_template(:public)
    end
  end

  describe 'GET show' do
    context 'when user is signed in' do
      let(:user) { FactoryBot.create(:user) }

      before { sign_in(user) }

      after { sign_out(user) }

      it 'renders the dashboard' do
        get :show, params: { id: user.id }
        expect(response).to render_template(:show)
      end
    end

    context 'when user is not signed in' do
      it 'renders the public page' do
        get :show, params: { id: 99 }
        expect(response).to redirect_to(public_user_path(id: 99))
      end
    end
  end
end
