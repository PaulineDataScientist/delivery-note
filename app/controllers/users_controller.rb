class UsersController < ApplicationController
  def my_portfolio
    @user_stocks = current_user.stocks
    @user = current_user
  end

  def my_projects
    @user_projects = current_user.projects
    @user = current_user
  end

end
