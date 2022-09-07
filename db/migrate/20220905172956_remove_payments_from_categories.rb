class RemovePaymentsFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_reference :categories, :payment, null: false, foreign_key: true
  end
end
