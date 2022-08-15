class GoalsController < ApplicationController
  def index
    matching_goals = Goal.all

    @list_of_goals = matching_goals.order({ :created_at => :desc })

    render({ :template => "goals/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_goals = Goal.where({ :id => the_id })

    @the_goal = matching_goals.at(0)

    render({ :template => "goals/show.html.erb" })
  end

  def create
    the_goal = Goal.new
    the_goal.goal = params.fetch("query_goal")
    the_goal.creator_id = params.fetch("query_creator_id")
    the_goal.start_date = params.fetch("query_start_date")
    the_goal.end_date = params.fetch("query_end_date")
    the_goal.length = params.fetch("query_length")
    the_goal.bet_amount = params.fetch("query_bet_amount")

    if the_goal.valid?
      the_goal.save
      redirect_to("/goals", { :notice => "Goal created successfully." })
    else
      redirect_to("/goals", { :alert => the_goal.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_goal = Goal.where({ :id => the_id }).at(0)

    the_goal.goal = params.fetch("query_goal")
    the_goal.creator_id = params.fetch("query_creator_id")
    the_goal.start_date = params.fetch("query_start_date")
    the_goal.end_date = params.fetch("query_end_date")
    the_goal.length = params.fetch("query_length")
    the_goal.bet_amount = params.fetch("query_bet_amount")

    if the_goal.valid?
      the_goal.save
      redirect_to("/goals/#{the_goal.id}", { :notice => "Goal updated successfully."} )
    else
      redirect_to("/goals/#{the_goal.id}", { :alert => the_goal.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_goal = Goal.where({ :id => the_id }).at(0)

    the_goal.destroy

    redirect_to("/goals", { :notice => "Goal deleted successfully."} )
  end
end
