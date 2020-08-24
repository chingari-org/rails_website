class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :category
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
