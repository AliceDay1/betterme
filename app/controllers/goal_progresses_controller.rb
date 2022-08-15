class GoalProgressesController < ApplicationController
  def index
    matching_goal_progresses = GoalProgress.all

    @list_of_goal_progresses = matching_goal_progresses.order({ :created_at => :desc })

    render({ :template => "goal_progresses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_goal_progresses = GoalProgress.where({ :id => the_id })

    @the_goal_progress = matching_goal_progresses.at(0)

    render({ :template => "goal_progresses/show.html.erb" })
  end

  def create
    the_goal_progress = GoalProgress.new
    the_goal_progress.goal_participant_id = params.fetch("query_goal_participant_id")
    the_goal_progress.date_time = params.fetch("query_date_time")
    the_goal_progress.goal_id = params.fetch("query_goal_id")
    the_goal_progress.goal_progress_status = params.fetch("query_goal_progress_status")

    if the_goal_progress.valid?
      the_goal_progress.save
      redirect_to("/goal_progresses", { :notice => "Goal progress created successfully." })
    else
      redirect_to("/goal_progresses", { :alert => the_goal_progress.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_goal_progress = GoalProgress.where({ :id => the_id }).at(0)

    the_goal_progress.goal_participant_id = params.fetch("query_goal_participant_id")
    the_goal_progress.date_time = params.fetch("query_date_time")
    the_goal_progress.goal_id = params.fetch("query_goal_id")
    the_goal_progress.goal_progress_status = params.fetch("query_goal_progress_status")

    if the_goal_progress.valid?
      the_goal_progress.save
      redirect_to("/goal_progresses/#{the_goal_progress.id}", { :notice => "Goal progress updated successfully."} )
    else
      redirect_to("/goal_progresses/#{the_goal_progress.id}", { :alert => the_goal_progress.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_goal_progress = GoalProgress.where({ :id => the_id }).at(0)

    the_goal_progress.destroy

    redirect_to("/goal_progresses", { :notice => "Goal progress deleted successfully."} )
  end
end
