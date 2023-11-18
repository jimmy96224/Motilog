class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.integer :user_id
      t.integer :instrument_id
      t.date :date
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
