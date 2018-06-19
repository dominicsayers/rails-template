# frozen_string_literal: true

RSpec.describe UsersController, type: :routing do
  let(:path) { public_user_path(id: 99) }

  HTTPMethods.fetch_methods.each do |http_method|
    it "routes #{http_method} public_user_path to the user's public page" do
      expect(http_method => path).to route_to(
        controller: 'users',
        action: 'public',
        id: '99',
      )
    end
  end

  HTTPMethods.non_fetch_methods.each do |http_method|
    it "does not route #{http_method} public_user_path" do
      expect(http_method => path).not_to be_routable
    end
  end
end
