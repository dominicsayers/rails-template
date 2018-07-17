# frozen_string_literal: true

RSpec.describe 'accounts/edit', type: :view do
  let(:account) { create(:account) }

  it 'renders the edit account form' do
    assign(:account, account)
    render

    assert_select 'form[action=?][method=?]', account_path(account), 'post' do
    end
  end
end
