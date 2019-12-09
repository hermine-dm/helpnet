class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
    	t.belongs_to :organization, index: true
    	t.references :address, index: true
    	t.datetime :start_date
    	t.datetime :end_date
    	t.text :description
    	t.string :title
    	t.timestamps
    end
  end
end
