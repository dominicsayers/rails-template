# frozen_string_literal: true

RSpec.describe 'accounts/new', type: :view do
  before do
    assign(:account, build(:account))
  end

  it 'renders new account form' do
    render

    assert_select 'form[action=?][method=?]', accounts_path, 'post' do
    end
  end
end
