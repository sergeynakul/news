class Admin < User
  has_many :articles, dependent: :destroy
end
