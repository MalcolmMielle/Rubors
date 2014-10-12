class UsersController < ApplicationController
	#Functions
	before_action :get_user, only: [:show, :edit, :update, :destroy]	
	
	def get_user
		@user=User.find(params[:id])
	end	


	def show
		@rumors=Rumor.where(user: @user)
		respond_to do |format|
			format.html {render action: 'show'}
			format.json {render json: @user}
			format.xml {render xml: @user}
		end
	end
	def index
		respond_to do |format|
			format.html {render action: 'index'}
			format.json {render json: @user}
			format.xml {render xml: @user}
		end
	end
	def create
		@user = User.create(user_params)
		redirect_to user_path(@user)
	end
end
