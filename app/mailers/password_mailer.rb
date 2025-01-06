class PasswordMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    user = User.find_by(email: params[:user][:email])
    if user
      @token = user.signed_id(purpose: "password_reset", expires_in: 15.minutes)
      mail to: user.email
    else
      flash[:alert] = "Email not found"
      render :new, status: :unprocessable_entity
    end
  end
end
