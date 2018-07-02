class UsersController < ApplicationController
  before_action :sign_in_required, only: [:top]
  
  def top
    @users=User.all
  end
end
