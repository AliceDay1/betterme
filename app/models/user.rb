# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:user_to_goal_relationship_participation, { :class_name => "GoalUserRelationship", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:goal_progress, { :class_name => "GoalProgress", :foreign_key => "goal_participant_id", :dependent => :destroy })

  has_many(:goals, { :class_name => "Goal", :foreign_key => "creator_id", :dependent => :destroy })
  has_many(:participated_goals, { :through => :user_to_goal_relationship_participation, :source => :goal })
end
