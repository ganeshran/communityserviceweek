class SwInteraction < ActiveRecord::Base
#	attr_accessible :organization, :volunteerHours, :category
	validates :organization, presence: true
	validates :volunteerHours, presence: true, numericality: true
	validates :activitydate, presence:true
end
