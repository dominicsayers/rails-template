# frozen_string_literal: true

RSpec.describe UsersController, type: :routing do
  let(:path) { public_user_path(id: 99) }

  %i[get head].each do |http_method|
    it "routes #{http_method.to_s.upcase} public_user_path to the user's public page" do
      expect(get: path).to route_to(
        controller: 'users',
        action: 'public',
        id: '99',
      )
    end
  end

  ActionDispatch::Routing::HTTP_METHODS.without(:get, :head).each do |http_method|
    it "does not route #{http_method.to_s.upcase} public_user_path" do
      expect(http_method => path).not_to be_routable
    end
  end
end
