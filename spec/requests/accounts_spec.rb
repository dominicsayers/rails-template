# frozen_string_literal: true

RSpec.describe 'Accounts', type: :request do
  describe 'GET /accounts' do
    let(:user) { FactoryBot.create(:user) }

    before { sign_in(user) }

    after { sign_out(user) }

    it 'works! (now write some real specs)' do
      get accounts_path
      expect(response).to have_http_status(:ok)
    end
  end
end
