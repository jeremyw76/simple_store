class AddCategoryToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :category, foreign_key: true
    change_column_null :products, :category_id, false
  end
end
