class ChangeUserAddress < ActiveRecord::Migration[5.2]
  def change
  	 add_reference :users, :address, index: true
  	 remove_column :users, :zip_code, :string
  end
end
