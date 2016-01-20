class UsersController < ApplicationController
  
  def show
    if user_signed_in?
      @email = current_user.email
      @sign_in = current_user.last_sign_in_at
    else
      redirect_to welcome_path
    end
  end
  
end
