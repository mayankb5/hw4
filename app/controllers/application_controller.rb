class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    puts "------------------ code before every request ------------------"
    def current_user
      @current_user = User.find(session[:user_id]) if session[:user_id]
  end

end
