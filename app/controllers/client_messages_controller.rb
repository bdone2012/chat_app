class ClientMessagesController < ApplicationController
	def index
		@client_messages = ClientMessage.all
	end
	
	def new
	    @client_message = ClientMessage.new
	    @users = User.all
	    @trainers = Trainer.all
	    if logged_in?
			@user_messages = ClientMessage.where(email_user: current_user.email)
		elsif logged_in_trainer?
			@trainer_messages = ClientMessage.where(email_trainer: current_trainer.email)
		end
	    # binding.pry
	end

	def create
		
		@client_message = ClientMessage.new(client_message_params)
		if @client_message.save
			if logged_in? == true
				@client_message.update(user_id: current_user.id )
			elsif logged_in_trainer? == true
				@client_message.update(trainer_id: current_trainer.id )
			end
		  binding.pry
		  redirect_to("/client_messages/new")
		else
		  render :new
		end
	end


	def show
		@client_message = ClientMessage.find_by(id: params[:id])
	end

	private

	def client_message_params
		params.require(:client_message).permit(
			:user_id,
			:trainer_id,
			:message_content,
			:email_user,
			:email_trainer
		)
	end
end
