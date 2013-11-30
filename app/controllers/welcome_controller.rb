class WelcomeController < ActionController::Base
  
  protect_from_forgery with: :exception
  layout 'welcome_layout'
  
  def index
    @new_user = User.new
  end
  
  def login
    user = User.find_by_email(params[:login][:email]).to_a[0]
    if user && User.encrypt(params[:login][:password], user.salt) == user.password
        session[:id] = user.id
        session[:full_name] = user.full_name
        
        redirect_to controller: :main, action: :index
    else
        flash.now[:warning] = "Invalid email or password"
        @new_user = User.new
        render 'index' 
    end
  end
  
  def register
    @new_user = User.new register_params
    if @new_user.save
      flash.now[:success] = "Your account was successfully created!"
    end
    render 'index'
  end
  
  private
  
  def register_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
  
end
