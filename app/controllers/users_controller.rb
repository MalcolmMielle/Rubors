class UsersController < ApplicationController
	#Functions
	before_action :get_user, only: [:show, :edit, :update, :destroy]	
	
	def get_user
		@user=User.find(params[:id])
	end	


	def index
	
	end
	def show
		respond_to do |format|
			format.html {render action: 'show'}
			format.json {render json: @user}
			format.xml {render xml: @user}
		end
	end
	def create
		@user = User.create(user_params)
		redirect_to user_path(@user)
	end
end
