class ApplicationController < ActionController::Base
    before_action :set_locale
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404

    def render_404
        redirect_to videos_path, notice: "Video não encontrado"
    end
 
    def set_locale
        session[:locale] = params[:locale] if params[:locale].present?
        I18n.locale = session[:locale] || I18n.default_locale
    end
end
