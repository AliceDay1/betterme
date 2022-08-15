class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :goal
      t.integer :creator_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :length
      t.integer :bet_amount

      t.timestamps
    end
  end
end
