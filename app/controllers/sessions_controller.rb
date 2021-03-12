class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
      if @user && @user.password == params[:password]
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to '/login'
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def session_params
      params.require(:session).permit(:username, :password)
    end

end
