class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :visibility, default: 'private'
      t.string :reference, index: { unique: true }
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
