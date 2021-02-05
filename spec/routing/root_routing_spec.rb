# frozen_string_literal: true

RSpec.describe ApplicationController, type: :routing do
  context 'with non-account subdomain' do
    let(:url) { 'https://www.example.com' }

    HTTPMethods.fetch_methods.each do |http_method|
      it "routes #{http_method} / to the home page" do
        expect(http_method => url).to route_to('pages#home')
      end
    end

    HTTPMethods.non_fetch_methods.each do |http_method|
      it "does not route #{http_method} /" do
        expect(http_method => url).not_to be_routable
      end
    end
  end

  context 'with account subdomain' do
    let(:url) { 'https://foo.example.com' }

    HTTPMethods.fetch_methods.each do |http_method|
      it "routes #{http_method} / to the account home page" do
        expect(http_method => url).to route_to('accounts#home')
      end
    end

    HTTPMethods.non_fetch_methods.each do |http_method|
      it "does not route #{http_method} /" do
        expect(http_method => url).not_to be_routable
      end
    end
  end
end
