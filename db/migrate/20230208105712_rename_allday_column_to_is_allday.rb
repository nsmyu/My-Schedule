class RenameAlldayColumnToIsAllday < ActiveRecord::Migration[6.1]
  def change
    rename_column :schedules, :allday, :is_allday
  end
end
