class AddHelpersNeededToWorkEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :work_events, :helpers_needed, :integer
  end
end
