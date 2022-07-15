class HomeController < ApplicationController
  before_action :get_bank_account

  def index
  end
  
  private

  def get_bank_account
    @bank_account = current_user.bank_account
  end

end
