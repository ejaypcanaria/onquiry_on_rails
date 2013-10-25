class WelcomeController < ApplicationController
  
  layout 'welcome_layout'
  
  def index
    @new_user = User.new
  end
  
  def register
    @new_user = User.new register_params
    if @new_user.save
      flash[:notice] = "Your account was successfully created!"
    end
    render 'index'
  end
  
  
  private
  
  def register_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end
