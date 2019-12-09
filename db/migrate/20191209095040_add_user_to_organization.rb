class AddUserToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_reference :organizations, :user, foreign_key: true
    add_column :organizations, :validatedbyadmin, :boolean, default: false
  end
end
