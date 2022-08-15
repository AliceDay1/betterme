desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

  user= User.new
  user.email="Alice@example.com"
  user.password="password"
  user.save

  user= User.new
  user.email="Jimmy@example.com"
  user.password="password"
  user.save

  user= User.new
  user.email="Gary@example.com"
  user.password="password"
  user.save

  user= User.new
  user.email="Margarate@example.com"
  user.password="password"
  user.save

  user= User.new
  user.email="Maggie@example.com"
  user.password="password"
  user.save

  user= User.new
  user.email="Edita@example.com"
  user.password="password"
  user.save

  user= User.new
  user.email="Luv@example.com"
  user.password="password"
  user.save

  if user.errors.any?
    p user.errors.full_messages
  end
  
  20.times do
    another_user="#{Faker::Name.unique.name}@example.com"
    another_user.password="password"
    another_user.save
  end 

  p "#{User.count} uesrs are in the database."


  # 5.times do 
  #   goal=Goal.new
  #   goal.bet_amount="dollar amount"
  #   goal.goal ="goal_description"
  #   goal.length="duration of the goal"
  #   goal.start_date="start date of the goal"
  #   goal.end_date="end date of the goal"
  #   goal.creator_id =user.id
  #   goal.save
  # end
    
    #id         :integer          not null, primary key
    #  bet_amount :integer
    #  end_date   :datetime
    #  goal       :string
    #  length     :integer
    #  start_date :datetime
    #  created_at :datetime         not null
    #  updated_at :datetime         not null
    #  creator_id :integer
#     goal=Goal.new
#    goal.bet_amount="3000"
#    goal.goal ="Sleep by 11pm local time"
#    goal.length="30 days"
#   goal.start_date="08-01-2022"
#   goal.end_date="09-01-2022"
#    goal.creator_id =user.id
#    goal.save
# p "#{Goal.count} goals in the database."
end
