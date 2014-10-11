class RumorsController < ApplicationController

	#Functions
	before_action :get_rumor, only: [:show, :edit, :update, :destroy]
	before_action :check_auth, only: [:edit, :update, :destroy]
	
	
	def get_rumor
		@rumor=Rumor.find(params[:id])
	end		
		
	def check_auth
		if session[:user_id]!=@rumor.user_id
			flash[:notice]="The rumors spread fast... and you can't edit it !"
			redirect_to(rumors_path)
		end
	end

	#SHOW PAGES ACTION
	def index #show all rumors
	
	end
	def show #show one tweet
		respond_to do |format|
			format.html {render action: 'show'}
			format.json {render json: @rumor}
			format.xml {render xml: @rumor}
		end
	end
	def new #show form for a new rumor
	
	end
	def edit #show edit action
		
	end
	def create #create a tweet
	
	end
	def update
	
	end
	def destroy
	
	end
end