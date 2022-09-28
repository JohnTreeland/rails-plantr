class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sitter, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :plants_quantity

      t.timestamps
    end
  end
end
