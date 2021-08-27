class UsersController < ApplicationController
  
  def index
   @users = User.paginate(page: params[:page], per_page: 4) 
  end

  def show
    @user = User.find(params[:id])
    @user_tasks = @user.tasks.paginate(page: params[:page], per_page: 1)
    end


  def destroy
    #byebug
    @user = User.find(params[:id]) 
    if @user.destroy
      redirect_to '/users'
    end
      flash[:notice] = 'Something wrong'
  end

  def user_params
    params.require(:user).permit(:name, :email, :role,:phone, :address ,:image)
  end
end
