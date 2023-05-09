class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_ransack_search

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    def set_ransack_search
      @q = Anime.ransack(params[:q])
    end
end
