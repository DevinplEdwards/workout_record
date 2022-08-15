class SetEntryWeightDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :entries, :weight, :integer, default: 0
  end
end
