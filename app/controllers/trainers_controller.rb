class TrainersController < ApplicationController
	def new
		@trainer = Trainer.new
		@users = User.all
		@trainers = Trainer.all
	end

	def create
		@trainer = Trainer.new(trainer_params)
		if @trainer.save
		  redirect_to("/")
		else
		  render :new
		end
	end

	private

	def trainer_params
	params.require(:trainer).permit(
	  :name,
	  :email,
	  :password,
	  :password_confirmation
	)
	end
end
