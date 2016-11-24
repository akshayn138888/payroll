class TimeSheetsController < ApplicationController
	def new
		@time_sheets = current_user.time_sheets
		@check_in = false
		@check_out = false
		if @time_sheets.count > 0
			# @time_sheets.each do |time|
			time = @time_sheets.last
			if time.check_in and time.check_in.strftime("%D") == Time.now.strftime("%D")
				@check_in = true if time.try(:check_in).present?
				@check_out = true if time.try(:check_out).present?
				@time_sheet = time
				if @check_in && @check_out
					@time_sheet = TimeSheet.new
					@check_in = false
					@check_out = false
				end
			else
				# @time_sheet = TimeSheet.new
				@check_in = true if time.try(:check_in).present?
				@check_out = true if time.try(:check_out).present?
				@time_sheet = time
				if @check_in && @check_out
					@time_sheet = TimeSheet.new
					@check_in = false
					@check_out = false
				end
			end
			# end
		else
			@time_sheet = TimeSheet.new
		end
	end

	def create
		params[:time_sheet][:check_in] = Time.now
		@time_sheet = current_user.time_sheets.build(time_sheet_params)
		@time_sheet.timezone = Time.zone.name
		if @time_sheet.save
			redirect_to :back, notice: "Check in sucessfully"
		else
			redirect_to :back, notice: @time_sheet.errors
		end
	end

	def update
		params[:time_sheet][:check_out] = Time.now
		@time_sheet = current_user.time_sheets.find_by_id(params[:id])	
		if @time_sheet.present? && @time_sheet.update(time_sheet_params)
			redirect_to :back, notice: "Check out sucessfully"
		else
			redirect_to :back, notice: @time_sheet.errors
		end
	end

	private
	def time_sheet_params
		params.require(:time_sheet).permit(:user_id,:check_in,:check_out)
	end
end
