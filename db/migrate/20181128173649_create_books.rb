class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn
      t.date :publishedDate
      t.references :category, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
