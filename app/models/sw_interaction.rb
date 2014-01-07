class SwInteraction < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :organization, presence: true
	validates :volunteerHours, presence: true, numericality: true
	validates :activitydate, presence:true
end
