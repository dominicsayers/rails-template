# frozen_string_literal: true

RSpec.describe UsersController, type: :routing do
  let(:path) { public_user_path(id: 99) }

  it "routes GET public_user_path to the user's public page" do
    http_get_methods.each do |http_method|
      expect(http_method => path).to route_to(
        controller: 'users',
        action: 'public',
        id: '99',
      )
    end
  end

  it 'does not route non-GET methods' do
    http_non_get_methods.each { |http_method| expect(http_method => path).not_to be_routable }
  end
end
