# frozen_string_literal: true

RSpec.describe 'accounts/show', type: :view do
  before do
    @account = assign(:account, Account.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
