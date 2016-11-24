class TimeSheet < ActiveRecord::Base
	belongs_to :user
	def date?
		created_at.present? ? created_at.strftime("%D") : "-"
	end

	def check_in?
		check_in.present? ? check_in.strftime("%T %p") : "-"
	end

	def check_out?
		check_out.present? ? check_out.strftime("%T %p") : "-"
	end
end
