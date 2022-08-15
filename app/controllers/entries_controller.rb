class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise

  def create
    @entry = @exercise.build_entry(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to exercise_path(@exercise), notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { redirect_to exercise_path(@exercise), status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @entry = @exercise.entry.find(params[:id])
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to exercise_url(@exercise), notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry = @exercise.entries.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to exercise_url(@exercise), notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_exercise
      @exercise = Exercise.find(params[:exercise_id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:weight)
    end
end
