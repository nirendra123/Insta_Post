class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :description
      t.references :post, null: false, foreign_key: true

      t.references :parent_comment, foreign_key: { to_table: :comments }, null: true
      t.timestamps
    end
    #  add_index :comments, :comment_id
  end
end
