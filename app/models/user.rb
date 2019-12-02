class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :zip_code, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" } 
  #validates :name, uniqueness: true

  after_create :generate_name

  def generate_name
  	self.update(name: self.id)
  end

end
