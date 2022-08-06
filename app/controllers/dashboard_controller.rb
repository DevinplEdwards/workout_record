class DashboardController < ApplicationController
    before_action :set_exercise, only: %i[ show edit update destroy ]
    before_action :set_entry, only: %i[ show edit update destroy ]

    def dashboard
        @entries = Entry.all
        @exercises = Exercise.all
    end

    # Only allow a list of trusted parameters through.
    def dashboard_params
        params.permit(:activity, exercise_attributes: [:id, :activities], entries_attributes: [:id, :weight])
    end

end
