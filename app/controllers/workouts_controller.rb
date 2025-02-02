class WorkoutsController < ApplicationController
  skip_before_action :authorize_request, only: [:create, :index]

  def index
    user = User.find(params[:user_id])
    render json: user.workouts
  end

  def create
    workout = Workout.new(name: params[:name], user_id: params[:user_id])
    if workout.save
      render json: workout
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    # destroy logic
  end

  private

  def find_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :complete, :user_id)
  end
end
