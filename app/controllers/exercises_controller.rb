class ExercisesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_exercise, only: %i[ show edit update destroy ]
    before_action :set_user

  # GET /exercises or /exercises.json
  def index
    @exercises = Exercise.all
  end

  # GET /exercises/1 or /exercises/1.json
  def show
    @entry = Entry.new
  end

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

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to exercise_url(@exercise), notice: "Exercise was successfully created." }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1 or /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to exercise_url(@exercise), notice: "Exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1 or /exercises/1.json
  def destroy
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
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

end
