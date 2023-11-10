class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.integer :instrument_id
      t.date :date
      t.text :log
      t.timestamps
    end
  end
end
