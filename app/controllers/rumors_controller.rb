require 'message'

class RumorsController < ApplicationController

	#Functions
	before_action :get_rumor, only: [:show, :edit, :update, :destroy]
	#before_action :check_auth, only: [:edit, :update, :destroy]
	
	
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
		if params[:name]
			@user= User.where(name: params[:name]).first
			@rumor=@user.rumors
		else
			@rumor=Rumor.all
		end
#		respond_to do |format|
#			format.html {render action: 'index'}
#			format.json {render json: @rumor}
#			format.xml {render xml: @rumor}
#		end
	end
	def show #show one tweet
		respond_to do |format|
			format.html {render action: 'show'}
			format.json {render json: @rumor}
			format.xml {render xml: @rumor}
		end
	end
	def new #show form for a new rumor
		@rumor=Rumor.new
		
	end

	def create #create a tweet
		
		@user=User.where(:name =>params[:rumor][:user]).first #TODO
		
		#debugger
		@rumor=Rumor.new(:status => params[:rumor][:status], :user => @user)
		
		if @user!=nil and @rumor.save #Vérifie que l'utilisateur est bien enregistrer
			redirect_to rumors_path, :notice => "Success"
		else
			render "new"
		end
	end
	def edit #show edit action
		@rumor=Rumor.find(params[:id])
	end
	def update
		@rumor= Rumor.find(params[:id])
		if @rumor.update_attributes(rumor_params)
			redirect_to rumors_path, :notice => "More details... more rumors"
		else
			render "edit"
		end
	end
	def destroy
	
	end
	
	
	private

	def rumor_params
	params.require(:rumor).permit(:status)
	end
	
	
end
