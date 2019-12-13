# frozen_string_literal: true

class Address < ApplicationRecord
  validates :zip_code, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: 'please enter a valid french zip code' }, on: :update, if: proc { |u| u.zip_code.present? }
  has_many :events
  has_many :users
  has_many :organizations

  def numberandstreet
    @address = if !number.nil?
                 "#{number}, #{street}"
               else
                 street.to_s
               end
    @address
  end

  def zip_codeandcity
    @address = "#{zip_code} #{city}"
  end

  def google_format
    @address = "#{number}#{street}#{zip_code}#{city},France"
    @address_url = CGI.escape(@address)
  end
end
