class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    @user = User.find_by email: params[:user][:email]
    if @user.present?
      if @user.bye?
        flash[:error] = t "user_locked"
        redirect_to user_session_path
      else
        super
      end
    else
      flash[:error] = "ko ton tai"
      redirect_to user_session_path
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
