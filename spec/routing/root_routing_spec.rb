# frozen_string_literal: true

RSpec.describe ApplicationController, type: :routing do
  context 'with non-account subdomain' do
    let(:url) { 'https://www.example.com' }

    it 'routes GET / to the home page' do
      http_get_methods.each do |http_get_method|
        expect(http_get_method => url).to route_to('pages#home')
      end
    end

    it 'does not route non-GET /' do
      http_non_get_methods.each do |http_non_get_method|
        expect(http_non_get_method => url).not_to be_routable
      end
    end
  end

  context 'with account subdomain' do
    let(:url) { 'https://foo.example.com' }

    it 'routes GET / to the account home page' do
      http_get_methods.each do |http_get_method|
        expect(http_get_method => url).to route_to('accounts#home')
      end
    end

    it 'does not route non-GET /' do
      http_non_get_methods.each do |http_non_get_method|
        expect(http_non_get_method => url).not_to be_routable
      end
    end
  end
end
