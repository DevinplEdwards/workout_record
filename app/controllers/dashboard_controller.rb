class DashboardController < ApplicationController
    before_action :authenticate_user!, :set_user

    def dashboard
        @exercises = current_user.exercises.includes(:entry)
        @entries = Entry.all
        @entry = Entry.new
    end

    private
    def set_user
        @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def dashboard_params
        params.permit(:activity, exercise_attributes: [:id, :activities], entry_attributes: [:id, :weight])
    end

end
