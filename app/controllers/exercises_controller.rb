class ExercisesController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_exercise, only: %i[show edit update destroy]

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # GET /exercises/1/edit
  def edit
    @exercise = Exercise.find(params[:id])
  end

  # POST /exercises or /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user = current_user
    respond_with_exercise(@exercise, "Exercise was successfully created.", "Failed to create exercise!")
  end

  def create_default_entry
    entries.create(weight: 0)
  end

  # PATCH/PUT /exercises/1 or /exercises/1.json
  def update
    @exercise = Exercise.find(params[:id])
    respond_with_exercise(@exercise, "Exercise was successfully updated.", "Failed to update exercise!")
  end

  # DELETE /exercises/1 or /exercises/1.json
  def destroy
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: "Exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:activity, entry_attributes: [:id, :weight], user_attributes: [:id])
    end

    def respond_with_exercise(exercise, notice_message, error_message)
      if exercise.save
        notice: notice_message
      else
        status: :unprocessable_entity, alert: error_message
      end
    end

end
