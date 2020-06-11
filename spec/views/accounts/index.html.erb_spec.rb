# frozen_string_literal: true

RSpec.describe 'accounts/index', type: :view do
  before do
    assign(:accounts, [
             Account.create!,
             Account.create!,
           ])
  end

  it 'renders a list of accounts' do
    render
  end
end
