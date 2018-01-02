# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

    def after_sign_in_path_for(resource)
      if resource.new_user
        flash[:notice] = 'Por favor, atualize suas informações.'
        return edit_user_registration_path
      end
      root_path
    end
end
