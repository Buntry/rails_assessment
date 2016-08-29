module UsersHelper
	def showable user
		link_to user.name, user
	end
	
	def deletable(user)
		if user == current_user
			delete_link user
		end
	end
	
	def delete_link user
		link_to 'Destroy', destroy_user_path(user), method: :delete
	end
end
