class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: user.email, subject: t("users.accountactivation")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("users.mailforgot")
  end
end
