class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  # validates :zip_code, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" }, on: :update #validate only for update
  validates :name, uniqueness: true, on: :update

  after_create :generate_name

  def generate_name #create a name from the email adress and id
  	a = self.email.chars.index("@") #find the position of @ in the email adress
  	self.update(name: "#{self.email.chars[0...a].join()}"+"#{self.id}")
  end

end
