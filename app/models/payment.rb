class Payment < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
