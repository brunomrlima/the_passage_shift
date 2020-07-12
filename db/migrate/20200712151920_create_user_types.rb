class CreateUserTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_types do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :type_name, default: "regular"

      t.timestamps
    end
  end
end
