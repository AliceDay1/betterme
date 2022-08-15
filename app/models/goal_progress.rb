# == Schema Information
#
# Table name: goal_progresses
#
#  id                   :integer          not null, primary key
#  date_time            :string
#  goal_progress_status :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  goal_id              :integer
#  goal_participant_id  :integer
#
class GoalProgress < ApplicationRecord
  belongs_to(:goal_challenge, { :required => true, :class_name => "Goal", :foreign_key => "goal_id" })
  belongs_to(:goal_participant, { :required => true, :class_name => "User", :foreign_key => "goal_participant_id" })
  belongs_to(:goal, { :required => true, :class_name => "GoalUserRelationship", :foreign_key => "goal_id" })
end
