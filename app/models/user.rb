class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :zip_code, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" }, on: :update, if: Proc.new { |u| u.zip_code.present? } #validate only for update
  validates :name, uniqueness: true, on: :update
  has_one_attached :avatar
  has_many :follows
  has_many :associations, through: :follows
  after_create :generate_name
  #after_create :welcome_send

  def generate_name #create a name from the email adress and id
  	a = self.email.chars.index("@") #find the position of @ in the email adress
  	self.update(name: "#{self.email.chars[0...a].join()}"+"#{self.id}")
  end
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
