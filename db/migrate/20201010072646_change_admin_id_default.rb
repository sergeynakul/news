class ChangeAdminIdDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:articles, :admin_id, from: 1, to: nil)
  end
end
