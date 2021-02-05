# frozen_string_literal: true

module RoutingHelper
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
