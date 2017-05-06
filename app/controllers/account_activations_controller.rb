class AccountActivationsController < ApplicationController

	def edit
		user = User.find_by(email: params[:email])
		if user && !user.acivated? && user.authentication?(:activation, params[:id])
			user.activate
			log_in user
			flash[:success] = "Account activated"
			redirect_to user
		else
			flah[:danger] = "Invalid Account activation link"
			redirect_to root_url
		end
	end




end
