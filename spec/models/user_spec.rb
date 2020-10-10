RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_presence_of(:password).on(:create) }
  it { is_expected.to validate_presence_of(:password_confirmation).on(:create) }
  it { is_expected.to validate_confirmation_of(:password) }
end
