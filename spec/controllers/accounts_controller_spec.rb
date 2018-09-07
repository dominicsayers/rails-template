# frozen_string_literal: true

RSpec.describe AccountsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Account. As you add validations to Account, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: 'foo',
      subdomain: 'bar',
    }
  end

  let(:invalid_attributes) do
    {
      foo: 'bar',
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AccountsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:user) { FactoryBot.create(:user) }

  before { sign_in(user) }

  after { sign_out(user) }

  describe 'GET #index' do
    it 'returns a success response' do
      create :account, valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      account = create :account, valid_attributes
      get :show, params: { id: account.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      account = create :account, valid_attributes
      get :edit, params: { id: account.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Account' do
        expect do
          post :create, params: { account: valid_attributes }, session: valid_session
        end.to change(Account, :count).by(1)
      end

      it 'redirects to the created account' do
        post :create, params: { account: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Account.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        expect do
          post :create, params: { account: invalid_attributes }, session: valid_session
        end.to raise_error(ActiveRecord::NotNullViolation)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          name: 'foo',
          subdomain: 'baz',
        }
      end

      it 'updates the requested account' do
        account = create :account, valid_attributes
        put :update, params: { id: account.to_param, account: new_attributes }, session: valid_session
        account.reload
        expect(account.subdomain).to eq('baz')
      end

      it 'redirects to the account' do
        account = create :account, valid_attributes
        put :update, params: { id: account.to_param, account: valid_attributes }, session: valid_session
        expect(response).to redirect_to(account)
      end
    end

    context 'with invalid params' do
      it 'redirects to the account' do
        account = create :account, valid_attributes
        put :update, params: { id: account.to_param, account: invalid_attributes }, session: valid_session
        expect(response).to redirect_to(account)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested account' do
      account = create :account, valid_attributes
      expect do
        delete :destroy, params: { id: account.to_param }, session: valid_session
      end.to change(Account, :count).by(-1)
    end

    it 'redirects to the accounts list' do
      account = create :account, valid_attributes
      delete :destroy, params: { id: account.to_param }, session: valid_session
      expect(response).to redirect_to(accounts_url)
    end
  end
end
