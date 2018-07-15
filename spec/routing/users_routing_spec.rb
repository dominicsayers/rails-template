# frozen_string_literal: true

RSpec.describe UsersController, type: :routing do
  describe 'resource routing' do
    let(:path) { user_path(id: 99) }

    context 'with non-account subdomain' do
      let(:url) { "https://www.example.com#{path}" }

      HTTPMethods.fetch_methods.each do |http_method|
        it "routes #{http_method} user_path to the user's page" do
          expect(http_method => url).to route_to(
            controller: 'users',
            action: 'show',
            id: '99',
          )
        end
      end

      HTTPMethods.non_fetch_methods.each do |http_method|
        it "does not route #{http_method} user_path" do
          expect(http_method => url).not_to be_routable
        end
      end
    end

    context 'with account subdomain' do
      let(:url) { "https://foo.example.com#{path}" }

      HTTPMethods.all.each do |http_method|
        it "does not route #{http_method} user_path" do
          expect(http_method => url).not_to be_routable
        end
      end
    end
  end

  describe '/public' do
    let(:path) { public_user_path(id: 99) }

    context 'with non-account subdomain' do
      let(:url) { "https://www.example.com#{path}" }

      HTTPMethods.fetch_methods.each do |http_method|
        it "routes #{http_method} public_user_path to the user's public page" do
          expect(http_method => url).to route_to(
            controller: 'users',
            action: 'public',
            id: '99',
          )
        end
      end

      HTTPMethods.non_fetch_methods.each do |http_method|
        it "does not route #{http_method} public_user_path" do
          expect(http_method => url).not_to be_routable
        end
      end
    end

    context 'with account subdomain' do
      let(:url) { "https://foo.example.com#{path}" }

      HTTPMethods.all.each do |http_method|
        it "does not route #{http_method} public_user_path" do
          expect(http_method => url).not_to be_routable
        end
      end
    end
  end
end
