class Review < ApplicationRecord

	belongs_to :article
	belongs_to :user

	validates_presence_of :body,:article_id,:user_id
	validates_length_of :body, within: 10...1000
end
