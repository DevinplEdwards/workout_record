class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :weight, default: 0

      t.timestamps
    end
  end
end
