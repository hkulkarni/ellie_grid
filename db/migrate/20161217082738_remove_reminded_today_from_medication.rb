class RemoveRemindedTodayFromMedication < ActiveRecord::Migration
  def change
    remove_column :medications, :reminded_today, :boolean
  end
end
