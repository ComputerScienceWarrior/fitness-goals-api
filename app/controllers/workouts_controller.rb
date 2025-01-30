class WorkoutsController < ApplicationController
  def index
    render json: user.workouts
  end

  def create
    workout = Workout.new(workout_params)
    if workout.save
      render json: workout
    else
      # handle errors gracefully
    end
  end

  def destroy

  end

  private

  def find_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :user_id)
  end
end
