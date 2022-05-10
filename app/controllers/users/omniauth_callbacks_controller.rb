# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    callback_from :github
  end

  def twitter
    callback_from :twitter
  end

  private

  def callback_from(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: provider.to_s) if is_navigational_format?
  end
end
