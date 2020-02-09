class Book < ApplicationRecord

	validates :title, presence: true
	validates :body, presence: true
	belongs_to :user  #, optional: true #有効にすると、user_idがnilでもvalidationでない



end
