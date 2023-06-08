class EntriesController < ApplicationController
  before_action :authenticate_user!, :set_exercise

  def create
    @entry = @exercise.build_entry(entry_params)
    @entry.user = current_user
    respond_with_entry(@entry, "Entry was successfully saved.", "Failed to save entry!")
  end

  def update
    @entry = Entry.find_by(id: params[:id])
    respond_to do |format|
    respond_with_entry(@entry, "Entry was successfully updated.", "Failed to save entry!")
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
      @exercise = Exercise.find_by(id: params[:exercise_id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:weight)
    end
end
