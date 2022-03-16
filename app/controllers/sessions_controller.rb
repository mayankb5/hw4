class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ email: params["email"] })
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session[:user_id] = @user.id
        flash[:notice] = "Welcome, #{@user.first_name}."
        redirect_to "/companies"
      else
        flash[:notice] = "Email or password not recognized"
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Email or password not recognized"
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Goodbye"
    redirect_to "/sessions/new"
  end
end
  