class TwitterAccountsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_twitter_account, only: [ :destroy ]
    def index
      @twitter_account=Current.user.twitter_account
    end

    def destroy
      @twitter_account.destroy
      redirect_to twitter_accounts_path, notice: "Disconnected Successfully!"
    end

    private

    def set_twitter_account
      @twitter_account=Current.user.twitter_account.find(
      params[:id]
      )
    end
end
