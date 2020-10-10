class Article < ApplicationRecord
  belongs_to :admin

  validates :title, presence: true
  validates :visibility, inclusion: { in: %w[private public] }
  validates :reference, uniqueness: true, allow_blank: true
  has_rich_text :content

  after_create :set_unique_reference

  private

  def set_unique_reference
    unique_reference = generate_unique_reference
    if Article.all.pluck(:reference).include?(unique_reference)
      set_unique_reference
    else
      update(reference: unique_reference)
    end
  end

  def generate_unique_reference
    string = '-------------------'
    chars_indexes = [0, 1, 2, 8, 9, 10, 16, 17, 18]
    numbers_indexes = [4, 5, 6, 12, 13, 14]
    chars = ('A'..'Z').to_a
    chars_indexes.each { |index| string[index] = chars.sample }
    numbers_indexes.each { |index| string[index] = rand(0..9).to_s }
    string
  end
end
