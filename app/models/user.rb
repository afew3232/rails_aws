class User < ApplicationRecord
	attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :validatable

	validates :name, presence: true, length: {minimum: 2}

	has_many :book, dependent: :destroy
end
