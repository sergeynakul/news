RSpec.describe Admin, type: :model do
  it { is_expected.to have_many(:articles).dependent(:destroy) }
end
