class Article < ApplicationRecord
  mount_uploader :feature_image_url, CoverUploader

  extend FriendlyId
  friendly_id :title,  use: [:slugged, :finders]
  has_many :reviews

  belongs_to :category
	validates_presence_of :title,:body,:category_id,:publish_date,:feature_image_url
	validate :publish_date_cannot_be_more_than_30_days
  validates_length_of :title, minimum: 5
  validates_length_of :body, minimum: 5
	#validate :publish_date_less_than_present_date

    
 
  	def publish_date_cannot_be_more_than_30_days
    	if publish_date.present? && publish_date > Date.today.next_month
      		errors.add(:publish_date, "Publish date should be within 30 days from the present date")
    	end
  	end

  	#def publish_date_less_than_present_date
  	#	if publish_date < Date.today
  	#		is_published :enabled 

  	#	end
  	#end



end
