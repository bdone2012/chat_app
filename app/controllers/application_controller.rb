class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # User
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  helper_method(:current_user, :logged_in?)

  # Trainer
  def current_trainer
    @current_trainer ||= Trainer.find_by(id: session[:trainer_id])
  end

  def logged_in_trainer?
    current_trainer.present?
  end

  helper_method(:current_trainer, :logged_in_trainer?)

end
