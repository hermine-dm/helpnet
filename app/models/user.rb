# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'email adress please' }
  validates :name, uniqueness: true, on: :update
  has_one :address
  has_one_attached :avatar
  has_many :articles
  has_many :article_likes
  has_many :article_comments
  has_many :follows
  has_many :organizations, through: :follows
  has_one :organization
  has_many :participations
  has_many :events, through: :participations
  after_create :generate_name
  after_create :welcome_send

  def generate_name # create a name from the email adress and id
    a = email.chars.index('@') # find the position of @ in the email adress
    update(name: email.chars[0...a].join.capitalize.to_s + id.to_s)
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
