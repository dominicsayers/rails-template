# frozen_string_literal: true

RSpec.describe 'Accounts', type: :request do
  describe 'GET /accounts' do
    let(:user) { FactoryBot.create(:user) }

    before { sign_in(user) }

    after { sign_out(user) }

    it 'shows the accounts' do
      account = FactoryBot.create(:account)
      get accounts_path
      expect(response.body).to include(account.name)
    end
  end
end
