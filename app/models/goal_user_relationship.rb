# == Schema Information
#
# Table name: goal_user_relationships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  goal_id    :integer
#  user_id    :integer
#
class GoalUserRelationship < ApplicationRecord
  belongs_to(:goal, { :required => true, :class_name => "Goal", :foreign_key => "goal_id" })
  belongs_to(:participant, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_many(:goal_progress, { :class_name => "GoalProgress", :foreign_key => "goal_id", :dependent => :destroy })
end
