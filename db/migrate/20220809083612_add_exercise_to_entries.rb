class AddExerciseToEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :exercise, foreign_key: true
  end
end
