class AddAttributsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :zip_code, :string
    add_column :users, :admin, :boolean, default: false
  end
end
