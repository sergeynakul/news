require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { create(:article) }
  let(:another_article) { create(:article) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_inclusion_of(:visibility).in_array(%w[private public]) }
  it { is_expected.to have_rich_text(:content) }

  it 'automatically generate unique reference after creation' do
    expect(article.reference).not_to eq another_article.reference
  end
end
