# frozen_string_literal: true

RSpec.describe ApplicationController, type: :routing do
  it 'routes GET / to the home page' do
    http_get_methods.each { |http_method| expect(http_method => '/').to route_to('pages#home') }
  end

  it 'does not route other methods /' do
    http_non_get_methods.each { |http_method| expect(http_method => '/').not_to be_routable }
  end
end
