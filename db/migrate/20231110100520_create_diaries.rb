class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.integer :user_id,       null: false
      t.integer :instrument_id, null: false
      t.date :date,             null: false
      t.string :title,          null: false
      t.text :text,             null: false
      t.timestamps
    end
  end
end
