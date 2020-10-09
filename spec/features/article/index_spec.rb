require 'rails_helper'

describe 'As user I could visit Home page and', type: :feature do
  let!(:articles) { create_list(:article, 3) }

  it 'see news feed with public articles' do
    visit root_path

    articles.each do |article|
      expect(page).to have_content article.title
    end
  end
end
