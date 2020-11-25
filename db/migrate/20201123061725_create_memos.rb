class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.text :content, null: false
      t.integer :url_id, null: false
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
