class AddNameandBirthToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name,     :string, default: ""
    add_column :users, :last_name,      :string, default: ""
    add_column :users, :date_of_birth,  :datetime
    add_column :users, :gender,         :string, default: ""
  end
end
