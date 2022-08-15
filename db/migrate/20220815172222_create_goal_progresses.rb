class CreateGoalProgresses < ActiveRecord::Migration[6.0]
  def change
    create_table :goal_progresses do |t|
      t.integer :goal_participant_id
      t.string :date_time
      t.integer :goal_id
      t.string :goal_progress_status

      t.timestamps
    end
  end
end
