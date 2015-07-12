class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
  end

  private

  def extract_locale_from_accept_language_header
    case request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    when 'pt'
      :'pt-BR'
    else
      :en
    end
  end
end
