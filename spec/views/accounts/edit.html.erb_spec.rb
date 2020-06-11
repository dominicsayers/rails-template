# frozen_string_literal: true

RSpec.describe 'accounts/edit', type: :view do
  before do
    @account = assign(:account, Account.create!)
  end

  it 'renders the edit account form' do
    render

    assert_select 'form[action=?][method=?]', account_path(@account), 'post' do
    end
  end
end
