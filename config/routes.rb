Rails.application.routes.draw do


  # Routes for the Goal progress resource:

  get("/", { :controller => "goals", :action => "index" })
  # CREATE
  post("/insert_goal_progress", { :controller => "goal_progresses", :action => "create" })
          
  # READ
  get("/goal_progresses", { :controller => "goal_progresses", :action => "index" })
  
  get("/goal_progresses/:path_id", { :controller => "goal_progresses", :action => "show" })
  
  # UPDATE
  
  post("/modify_goal_progress/:path_id", { :controller => "goal_progresses", :action => "update" })
  
  # DELETE
  get("/delete_goal_progress/:path_id", { :controller => "goal_progresses", :action => "destroy" })

  #------------------------------

  # Routes for the Goal user relationship resource:

  # CREATE
  post("/insert_goal_user_relationship", { :controller => "goal_user_relationships", :action => "create" })
          
  # READ
  get("/goal_user_relationships", { :controller => "goal_user_relationships", :action => "index" })
  
  get("/goal_user_relationships/:path_id", { :controller => "goal_user_relationships", :action => "show" })
  
  # UPDATE
  
  post("/modify_goal_user_relationship/:path_id", { :controller => "goal_user_relationships", :action => "update" })
  
  # DELETE
  get("/delete_goal_user_relationship/:path_id", { :controller => "goal_user_relationships", :action => "destroy" })

  #------------------------------

  # Routes for the Goal resource:

  # CREATE
  post("/insert_goal", { :controller => "goals", :action => "create" })
          
  # READ
  get("/goals", { :controller => "goals", :action => "index" })
  
  get("/goals/:path_id", { :controller => "goals", :action => "show" })
  
  # UPDATE
  
  post("/modify_goal/:path_id", { :controller => "goals", :action => "update" })
  
  # DELETE
  get("/delete_goal/:path_id", { :controller => "goals", :action => "destroy" })

  #------------------------------

  # Routes for the Task resource:

  # CREATE
  post("/insert_task", { :controller => "tasks", :action => "create" })
          
  # READ
  get("/tasks", { :controller => "tasks", :action => "index" })
  
  get("/tasks/:path_id", { :controller => "tasks", :action => "show" })
  
  # UPDATE
  
  post("/modify_task/:path_id", { :controller => "tasks", :action => "update" })
  
  # DELETE
  get("/delete_task/:path_id", { :controller => "tasks", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
