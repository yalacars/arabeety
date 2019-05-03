class PasswordResetsController < ApplicationController
  def create
  user = User.find_by_email(params[:email])
  user.send_password_reset if user
  redirect_to root_url, :notice => "Email sent with password reset instructions."
end

def edit
  @user = User.find_by_password_reset_token!(params[:id])
end

def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hours.ago
    redirect_to new_password_reset_path, :alert => "Password reset has expired."
  elsif @user.update(user_params)
    redirect_to root_url, :notice => "Password has been reset!"
  else
    redirect_to root_url, :notice => "Password has been reset!"
  end
end


 private
    # Use callbacks to share common setup or constraints between actions.
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:owner).permit(:password, :password_confirmation)
    end




end
