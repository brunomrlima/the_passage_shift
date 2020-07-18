class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :work_event, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
