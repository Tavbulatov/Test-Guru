class Admin::BaseController < ApplicationController
  before_action :admin_requared!

  layout 'admin'

  def admin_requared!
    redirect_to root_path, alert: 'You are not authorized to view this page' unless current_user.admin?
  end
end
