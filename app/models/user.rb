class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name


  enum role: {customer: 0 , admin: 1}
  has_many :forums , dependent: :destroy
  has_many :chats , dependent: :destroy

  def first_name
    self.name.split.first
  end

end
