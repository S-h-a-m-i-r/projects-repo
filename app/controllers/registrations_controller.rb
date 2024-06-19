class RegistrationsController < ApplicationController

  def index
    @user = User.all 
  end
  
  def new
        @user = User.new
  end
    
  def create
        @user = User.new(user_params)
        respond_to do |format|
          if @user.save

            format.html { redirect_to login_path, notice: "User is successfully created." }
            format.json { render json: @user, status: :created, location: @user }
           
          else
          
            flash.now[:alert] = 'There were errors in the form submission'
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
  end
    
      private
    
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
    
    
end
