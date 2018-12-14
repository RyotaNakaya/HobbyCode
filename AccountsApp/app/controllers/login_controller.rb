class LoginController < ApplicationController
    before_action :authenticate_account!

    def index
        @msg = "login page"
    end

    def login_check
        @account = current_account
        # @msg = "you logined at: "+ @account.current_sign_in_at.to_s
        @msg = "you logined at: "+ @account.id.to_s
    end
end
