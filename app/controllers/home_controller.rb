class HomeController < ApplicationController
	before_action :signed_in_user, only: [:gallery , :testimonials ]
	def index
	end

	def gallery
	end

	def testimonials
	end

	def faq
	end
end
