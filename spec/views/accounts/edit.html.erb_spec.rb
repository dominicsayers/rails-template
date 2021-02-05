# frozen_string_literal: true

RSpec.describe 'accounts/edit', type: :view do
  let(:account) { create(:account) }

  it 'renders the edit account form' do
    assign(:account, account)
    render

    assert_select 'form[action=?][method=?]', account_path(account), 'post' do
      assert_select 'input[name=?][value=?]', 'account[name]', account.name
      assert_select 'input[name=?][value=?]', 'account[subdomain]', account.subdomain
    end
  end
end
