# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :number
      t.string :street
      t.string :additionnal_information
      t.string :zip_code
      t.string :city
      t.timestamps
    end
  end
end
