desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

  user= User.new
  user.email="alice@example.com"
  user.password="password"
  user.save

  if user.errors.any?
    p uesr.errors.full+messages
  end


  
  p "#{User.count} uesrs are in the database"


end
