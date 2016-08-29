module ApplicationHelper
	def flash_alerts
		alerts = []
		alerts << flash[:alert] if flash[:alert]
		alerts << flash[:notice] if flash[:notice]
		alerts << flash[:error] if flash[:error]
		
		return alerts
	end
end
