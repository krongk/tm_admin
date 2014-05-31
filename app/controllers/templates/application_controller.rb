class Templates::ApplicationController < ApplicationController
  before_filter :authenticate_user!
  before_filter :can_access?

  private
  def can_access?
    unless current_user && current_user.roles_name.include?('admin')
      redirect_to root_path, notice: '没有权限访问'
    end
  end
end