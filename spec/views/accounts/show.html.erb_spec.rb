# frozen_string_literal: true

RSpec.describe 'accounts/show', type: :view do
  let(:account) { create(:account) }

  it 'renders attributes in <p>' do
    assign(:account, account)
    render
  end
end
