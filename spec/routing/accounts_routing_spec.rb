# frozen_string_literal: true

RSpec.describe AccountsController, type: :routing do
  let(:routable) do
    {
      '/accounts' => {
        get: { route: 'accounts#index' },
        head: { route: 'accounts#index' },
        post: { route: 'accounts#create' },
      },
      '/accounts/new' => {
        delete: { route: 'accounts#destroy', id: 'new' }, # TODO: Rails bug?
        get: { route: 'accounts#new' },
        head: { route: 'accounts#new' },
        patch: { route: 'accounts#update', id: 'new' }, # TODO: Rails bug?
        put: { route: 'accounts#update', id: 'new' }, # TODO: Rails bug?
      },
      '/accounts/1' => {
        delete: { route: 'accounts#destroy', id: '1' },
        get: { route: 'accounts#show', id: '1' },
        head: { route: 'accounts#show', id: '1' },
        patch: { route: 'accounts#update', id: '1' },
        put: { route: 'accounts#update', id: '1' },
      },
      '/accounts/1/edit' => {
        get: { route: 'accounts#edit', id: '1' },
        head: { route: 'accounts#edit', id: '1' },
      },
    }
  end

  def all_paths_and_routes
    routable.keys.each do |path|
      http_methods.each do |http_method|
        yield path, http_method
      end
    end
  end

  context 'when user is authenticated' do
    before { authenticated?(true) }

    it 'routes when routable' do
      all_paths_and_routes do |path, http_method|
        next unless (routing = routable.dig(path, http_method))
        expect(http_method => path).to route_to(routing.delete(:route), routing)
      end
    end

    it 'is unroutable otherwise' do
      all_paths_and_routes do |path, http_method|
        next if routable.dig(path, http_method)
        expect(http_method => path).not_to be_routable
      end
    end
  end

  context 'when no user is authenticated' do
    before { authenticated?(false) }

    it 'is unroutable' do
      all_paths_and_routes do |path, http_method|
        expect(http_method => path).not_to be_routable
      end
    end
  end
end
