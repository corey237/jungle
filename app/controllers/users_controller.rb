class UsersController < ApplicationController
  def new
  end

  def create
    if (user_params["password"] != user_params["password_confirmation"])
      @error_message = "Passwords do not match. Please try again."
      render "users/new"
    elsif (user_params["password"].length == 0)
      @error_message = "Password cannot be blank."
      render "users/new"
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
