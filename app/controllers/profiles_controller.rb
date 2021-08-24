class ProfilesController < ApplicationController
  
  def index  
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to root_path
    else
      flash.now[:error] ="not save"
    end
  end

  def edit
    @post = Profile.find(params[:id])
  end

  def update
  	#byebug
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to root_path
    end
   end


  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to root_path
  end

  private
    def profile_params
      params.require(:profile).permit( :birth_date, :address , :user_id , :dp)
    end
end
	