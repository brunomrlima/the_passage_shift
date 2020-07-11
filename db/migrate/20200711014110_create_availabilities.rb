class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :day
      t.string :hours

      t.timestamps
    end
  end
end
