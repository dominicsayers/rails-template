# frozen_string_literal: true

RSpec.describe UsersController, type: :routing do
  describe 'resource routing' do
    let(:path) { user_path(id: 99) }

    context 'with non-account subdomain' do
      let(:url) { "https://www.example.com#{path}" }

      it "routes GET user_path to the user's page" do
        http_get_methods.each do |http_get_method|
          expect(http_get_method => url).to route_to(
            controller: 'users',
            action: 'show',
            id: '99',
          )
        end
      end

      it 'does not route non-GET user_path' do
        http_non_get_methods.each do |http_non_get_method|
          expect(http_non_get_method => url).not_to be_routable
        end
      end
    end

    context 'with account subdomain' do
      let(:url) { "https://foo.example.com#{path}" }

      it 'does not route user_path' do
        http_methods.each do |http_any_method|
          expect(http_any_method => url).not_to be_routable
        end
      end
    end
  end

  describe '/public' do
    let(:path) { public_user_path(id: 99) }

    context 'with non-account subdomain' do
      let(:url) { "https://www.example.com#{path}" }

      it "routes GET public_user_path to the user's public page" do
        http_get_methods.each do |http_get_method|
          expect(http_get_method => url).to route_to(
            controller: 'users',
            action: 'public',
            id: '99',
          )
        end
      end

      it 'does not route non-GET public_user_path' do
        http_non_get_methods.each do |http_non_get_method|
          expect(http_non_get_method => url).not_to be_routable
        end
      end
    end

    context 'with account subdomain' do
      let(:url) { "https://foo.example.com#{path}" }

      it 'does not route public_user_path' do
        http_methods.each do |http_any_method|
          expect(http_any_method => url).not_to be_routable
        end
      end
    end
  end
end
