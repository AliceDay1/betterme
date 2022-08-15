class GoalUserRelationshipsController < ApplicationController
  def index
    matching_goal_user_relationships = GoalUserRelationship.all

    @list_of_goal_user_relationships = matching_goal_user_relationships.order({ :created_at => :desc })

    render({ :template => "goal_user_relationships/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_goal_user_relationships = GoalUserRelationship.where({ :id => the_id })

    @the_goal_user_relationship = matching_goal_user_relationships.at(0)

    render({ :template => "goal_user_relationships/show.html.erb" })
  end

  def create
    the_goal_user_relationship = GoalUserRelationship.new
    the_goal_user_relationship.goal_id = params.fetch("query_goal_id")
    the_goal_user_relationship.user_id = params.fetch("query_user_id")

    if the_goal_user_relationship.valid?
      the_goal_user_relationship.save
      redirect_to("/goal_user_relationships", { :notice => "Goal user relationship created successfully." })
    else
      redirect_to("/goal_user_relationships", { :alert => the_goal_user_relationship.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_goal_user_relationship = GoalUserRelationship.where({ :id => the_id }).at(0)

    the_goal_user_relationship.goal_id = params.fetch("query_goal_id")
    the_goal_user_relationship.user_id = params.fetch("query_user_id")

    if the_goal_user_relationship.valid?
      the_goal_user_relationship.save
      redirect_to("/goal_user_relationships/#{the_goal_user_relationship.id}", { :notice => "Goal user relationship updated successfully."} )
    else
      redirect_to("/goal_user_relationships/#{the_goal_user_relationship.id}", { :alert => the_goal_user_relationship.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_goal_user_relationship = GoalUserRelationship.where({ :id => the_id }).at(0)

    the_goal_user_relationship.destroy

    redirect_to("/goal_user_relationships", { :notice => "Goal user relationship deleted successfully."} )
  end
end
