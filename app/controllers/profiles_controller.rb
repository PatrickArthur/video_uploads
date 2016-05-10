class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.create(profile_params)
    if profile.present?
      profile.user_id = current_user.id
      profile.save!
      redirect_to profile_path(profile.id), flash: { success: "Created Profile" }
    else
      redirect_to new_profile_path, flash: { danger: 'Not Saved' }
    end
  end

  def destroy
    profile = Profile.find(params[:id])
    if profile.destroy
      redirect_to new_profile_path, flash: { success: 'Deleted Profile' }
    else
      redirect_to profile_path(profile.id), flash: { danger: 'Error' }
    end
  end


   private

   def profile_params
     params.require(:profile).permit(:name, :address, :city, :state, :phone, :zip, :avatar)
   end

end

