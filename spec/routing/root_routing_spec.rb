# frozen_string_literal: true

RSpec.describe ApplicationController, type: :routing do
  %i[get head].each do |http_method|
    it "routes #{http_method.to_s.upcase} / to the home page" do
      expect(get: '/').to route_to('pages#home')
    end
  end

  ActionDispatch::Routing::HTTP_METHODS.without(:get, :head).each do |http_method|
    it "does not route #{http_method.to_s.upcase} /" do
      expect(http_method => '/').not_to be_routable
    end
  end
end
