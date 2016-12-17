class AddLastAndNextReminderToMedication < ActiveRecord::Migration
  def change
    add_column :medications, :last_reminder, :datetime
    add_column :medications, :next_reminder, :datetime
  end
end
