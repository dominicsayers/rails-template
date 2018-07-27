# frozen_string_literal: true

RSpec.describe AccountsController, type: :routing do
  let(:routable) do
    {
      '/accounts' => {
        'GET' => { route: 'accounts#index' },
        'HEAD' => { route: 'accounts#index' },
        'POST' => { route: 'accounts#create' },
      },
      '/accounts/new' => {
        'DELETE' => { route: 'accounts#destroy', id: 'new' }, # TODO: Rails bug?
        'GET' => { route: 'accounts#new' },
        'HEAD' => { route: 'accounts#new' },
        'PATCH' => { route: 'accounts#update', id: 'new' }, # TODO: Rails bug?
        'PUT' => { route: 'accounts#update', id: 'new' }, # TODO: Rails bug?
      },
      '/accounts/1' => {
        'DELETE' => { route: 'accounts#destroy', id: '1' },
        'GET' => { route: 'accounts#show', id: '1' },
        'HEAD' => { route: 'accounts#show', id: '1' },
        'PATCH' => { route: 'accounts#update', id: '1' },
        'PUT' => { route: 'accounts#update', id: '1' },
      },
      '/accounts/1/edit' => {
        'GET' => { route: 'accounts#edit', id: '1' },
        'HEAD' => { route: 'accounts#edit', id: '1' },
      },
    }
  end

  def all_paths_and_routes
    routable.each_key do |path|
      HTTPMethods.all.each do |http_method|
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
