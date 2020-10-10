require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:admin) { create(:admin) }
  let(:articles) { create_list(:article, 3, admin: admin) }

  describe 'GET #index' do
    before { get :index }

    it 'populates an artiles' do
      expect(assigns(:articles)).to eq articles
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
