class AddAttributstoAssociations < ActiveRecord::Migration[5.2]
  def change
  	add_column :organizations, :content, :text
    add_column :organizations, :phone, :string
    add_column :organizations, :donate_link, :string
  end
end
