# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  skip_before_action :authenticate_user!
end
