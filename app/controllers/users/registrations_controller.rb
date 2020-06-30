# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    avatar = Photo.new
    file = File.open('app/assets/images/default-avatar.png')
    avatar.file.attach(io: file, filename: "avatar.png", content_type: 'image/png')
    avatar.photoable = @user
    avatar.save
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    if params[:user][:photo]
      avatar = @user.photo
      avatar.file.detach
      avatar.file.attach(params[:user][:photo][:file])
      @user.photo = avatar
      @user.save
    end
    super
  end
    # @user.update(user_params.except(:photos_attributes))
    # avatar = @user.photo
    # avatar.file.detach
    # avatar.file.attach(configure_account_update_params[:file])
    # @user.photo = avatar
    # @user.save
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    attributes = [:first_name, :last_name, :username, :bio]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    attributes = [:first_name, :last_name, :username, :bio, photos_attributes: [:file]]
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
