# frozen_string_literal: true

module RoutingHelper
  def http_methods
    @http_methods ||= ActionDispatch::Routing::HTTP_METHODS
  end

  def http_update_methods
    @http_update_methods ||= %i[patch put]
  end

  def http_get_methods
    @http_get_methods ||= %i[get head]
  end

  def http_non_get_methods
    @http_non_get_methods ||= http_methods.without(*http_get_methods)
  end

  # workaround for https://github.com/plataformatec/devise/issues/1670
  def authenticated?(hint)
    warden = double

    allow_any_instance_of(ActionDispatch::Request) # rubocop:disable RSpec/AnyInstance
      .to receive(:env)
      .and_wrap_original do |original, *args|
      env = original.call(*args)
      env['warden'] = warden
      env
    end

    allow(warden).to receive(:authenticate!).and_return(hint)
  end
end
