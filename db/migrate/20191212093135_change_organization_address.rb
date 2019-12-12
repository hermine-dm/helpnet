class ChangeOrganizationAddress < ActiveRecord::Migration[5.2]
  def change
  	add_reference :organizations, :address, index: true
  	remove_column :organizations, :zip_code, :string
  	remove_column :organizations, :location, :string
  end
end
