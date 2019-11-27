class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_locale
   locale = params[:locale].to_s.strip.to_sym
   I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
 end
<<<<<<< HEAD

=======
<<<<<<< HEAD
=======
 
>>>>>>> 5ad71f2... Chapter 5: Filling the layout
>>>>>>> 6075bef... Chapter 5: Filling the layout
end
