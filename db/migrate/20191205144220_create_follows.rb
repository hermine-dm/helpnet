class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
    	t.belongs_to :user, index: true
    	t.references :assoc, index: true
    	t.timestamps
    end
  end
end
