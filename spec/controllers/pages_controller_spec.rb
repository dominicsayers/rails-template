# frozen_string_literal: true

RSpec.describe PagesController, type: :controller do
  describe 'GET home' do
    it 'renders the expected view for home' do
      get :home
      expect(response).to render_template(:home)
    end
  end
end
