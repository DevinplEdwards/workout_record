module EntriesHelper
    def respond_with_entry(entry, notice_message, error_message)
        respond_to do |format|
                if entry.save
                    format.html { redirect_to dashboard_path, notice: notice_message }
                    format.json { render :show, status: :created, location: entry }
                else
                    format.html { redirect_to dashboard_path, status: :unprocessable_entity, alert: error_message }
                    format.json { render json: entry.errors, status: :unprocessable_entity }
                end
            end
        end
end
