
  class ProfilesController < ApplicationController
  def index
    #byebug
    if current_user.profile == nil || current_user.profile.birth_date == nil || current_user.profile.address == nil || current_user.profile.image.attached? == false
      @profile= Profile.new
    else
      redirect_to root_path
    end
  end

  def create
      #byebug
      @profile = Profile.new(profile_params)
      #byebug
        @profile.image.attach(params[:profile][:image])
        @profile.user_id=current_user.id
        if @profile.save
        redirect_to root_path
      else
        flash[:notice] = "enter all details"
        redirect_to profiles_path
      end
  end

  def update
    #byebug
    @profile = Profile.find(current_user.profile.id)
    
    if @profile.update(profile_params)
      @profile.image.attach(params[:profile][:image])
      redirect_to root_path
    end
  end


  private
    def profile_params
      params.require(:profile).permit(:birth_date, :address, :image)
    end
end