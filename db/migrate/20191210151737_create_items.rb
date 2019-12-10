class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.belongs_to :organization, index: true
    	t.string :name
    	t.text :description
    	t.string :category
    	t.string :type_of_transaction
    	t.boolean :availability, default: true
    	t.timestamps
    end
  end
end
