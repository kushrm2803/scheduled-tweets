class OmniauthCallbacksController < ApplicationController
  def twitter
    account = Current.user.twitter_account.where(username: auth.info.nickname).first_or_initialize
    account.update(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret,
    )

    redirect_to twitter_accounts_path, notice: "Successfully connected to your account."
  end

  def auth
    request.env["omniauth.auth"]
  end
end
