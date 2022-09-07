class Category < ApplicationRecord
  belongs_to :user
  has_many :payments
  validates :name, presence: true, length: { maximum: 250 }
  has_one_attached :icon

  def total_payments
    payments.sum(:amount)
  end
end
