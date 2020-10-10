class AddAdminIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :admin_id, :bigint, null: false, default: 1
    add_index :articles, :admin_id
    add_foreign_key :articles, :users, column: :admin_id
  end
end
