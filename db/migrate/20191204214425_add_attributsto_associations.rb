class AddAttributstoAssociations < ActiveRecord::Migration[5.2]
  def change
  	add_column :associations, :content, :text
    add_column :associations, :phone, :string
    add_column :associations, :donate_link, :string
  end
end
