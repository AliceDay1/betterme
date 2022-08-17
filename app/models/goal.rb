# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  bet_amount :integer
#  end_date   :datetime
#  goal       :string
#  length     :integer
#  start_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :integer
#
class Goal < ApplicationRecord
  has_many(:goal_user_relationships, { :class_name => "GoalUserRelationship", :foreign_key => "goal_id", :dependent => :destroy })
  has_many(:goal_progresses, { :class_name => "GoalProgress", :foreign_key => "goal_id", :dependent => :destroy })
  belongs_to(:creator, { :required => true, :class_name => "User", :foreign_key => "creator_id" })
  has_many(:participants, { :through => :goal_user_relationships, :source => :participant })

  # validates :body, :presence => true
  # validates :status, :presence =>true
  validates :creator_id, :presence => true
end
