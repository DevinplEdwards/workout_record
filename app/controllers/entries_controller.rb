class EntriesController < ApplicationController
  before_action :authenticate_user!, :set_exercise

  def create
    @entry = @exercise.build_entry(entry_params)
    @entry.user = current_user

    respond_to do |format|
      if @entry.save
        format.html { redirect_to dashboard_path, notice: "Entry was successfully saved." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { redirect_to dashboard_path, status: :unprocessable_entity, alert: "Failed to save entry!" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @entry = Entry.find_by(id: params[:id])
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to dashboard_path, notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Failed to save entry!" }
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
      @exercise = Exercise.find_by(id: params[:exercise_id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:weight)
    end
end
