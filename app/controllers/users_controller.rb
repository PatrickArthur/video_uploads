class UsersController < ApplicationController

   def index
     @users = User.all
   end

   def show
     @user = User.find(params[:id])
   end

   def new
     @user = User.new
   end

   def update
     user = User.create(user_params)
     if user.record_saved?
       redirect_to user_path(user.id), flash: { success: "Created Profile" }
     else
       redirect_to new_user_path, flash: { danger: 'Not Saved' }
     end
   end

   private

   def user_params
     params.require(:user).permit(:email,:name, :address, :city, :state, :phone, :zip)
   end

end
