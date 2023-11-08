class CreateInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :instruments do |t|
      t.integer :user_id, null: false
      t.string :name,     null: false
      t.string :profile,  null: false
      t.timestamps
    end
  end
end
