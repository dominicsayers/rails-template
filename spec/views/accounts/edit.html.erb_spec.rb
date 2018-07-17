# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'accounts/edit', type: :view do
  let(:account) { assign(:account, Account.create!) }

  it 'renders the edit account form' do
    render

    assert_select 'form[action=?][method=?]', account_path(account), 'post' do
    end
  end
end
