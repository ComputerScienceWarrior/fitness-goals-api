class ExercisesController < ApplicationController
  def index
    exercises = Exercise.all
    render json: exercises
  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :duration, :muscle_group_worked, :weight, :reps, :sets, :workout_id)
  end
end
