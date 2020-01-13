class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_path
      flash[:success] = 'Logged in!'
    else
      flash.now[:danger] = 'Invalid email or password'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
    flash[:warning] = 'Logged out!'
  end
end
