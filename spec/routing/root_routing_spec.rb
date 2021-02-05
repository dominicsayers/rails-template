# frozen_string_literal: true

RSpec.describe ApplicationController, type: :routing do
  HTTPMethods.fetch_methods.each do |http_method|
    it "routes #{http_method} / to the home page" do
      expect(http_method => '/').to route_to('pages#home')
    end
  end

  HTTPMethods.non_fetch_methods.each do |http_method|
    it "does not route #{http_method} /" do
      expect(http_method => '/').not_to be_routable
    end
  end
end
