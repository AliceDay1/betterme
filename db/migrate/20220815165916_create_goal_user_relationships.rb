class CreateGoalUserRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :goal_user_relationships do |t|
      t.integer :goal_id
      t.integer :user_id

      t.timestamps
    end
  end
end
