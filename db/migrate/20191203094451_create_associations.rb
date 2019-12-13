# frozen_string_literal: true

class CreateAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string   :name
      t.string :num_rna
      t.text :description
      t.string :zip_code
      t.string :location
      t.string :logo_url
      t.string :email
      t.string :website
      t.string :fb_website
      t.timestamps
    end
  end
end
