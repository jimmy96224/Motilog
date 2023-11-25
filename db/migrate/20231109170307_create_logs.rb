class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.integer :user_id,       null: false
      t.integer :instrument_id, null: false
      t.date :date,             null: false
      t.text :log,              null: false
      t.timestamps
    end
  end
end
