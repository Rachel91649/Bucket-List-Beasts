class RegistrationsController < Devise::RegistrationsController
	protected
	#after signup the user will be directed to the user show page by current user id if you are the current user
	def after_sign_up_path_for(resource)
		user_path(current_user.id) if current_user
	end

	def after_update_path_for(resource)
    user_path(resource)
  end

	private

	def sign_up_params
		params.require(:user).permit(:avatar, :first_name, :last_name, :age, :gender, :email, :password, :password_confirmation)
	end

	def update_params
		params.require(:user).permit(:avatar, :remove_avatar, :first_name, :last_name, :age, :gender, :email, :password, :password_confirmation, current)
	end
end