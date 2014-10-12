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
	def new #show form for a new rumor
		@user=User.new
		
	end

	def create #create a tweet
		
		#debugger
		@user=User.new(:name => params[:user][:name], :age => params[:user][:age])
		if @user.save
			redirect_to users_path, :notice => "Success"
		else
			render "new"
		end
	end
	
	
	private

	def user_params
	params.require(:user).permit(:name)
	end
end
