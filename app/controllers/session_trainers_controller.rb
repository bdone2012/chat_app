class SessionTrainersController < ApplicationController

  def new
  end

  def create
    trainer = Trainer.find_by(email: params[:email])
    if trainer && trainer.authenticate(params[:password])
      session[:trainer_id] = trainer.id
     redirect_to("/client_messages/new")
    else
      render(:new)
    end
  end

  def destroy
    session[:trainer_id] = nil
    redirect_to(root_path)
  end
end
