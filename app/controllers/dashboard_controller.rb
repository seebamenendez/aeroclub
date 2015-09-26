class DashboardController < ApplicationController

  def dashboard_v1
  end
  def dashboard_v2
  end
  def dashboard_v3
  end
  # set another layout for a specific action
  def dashboard_h
    render :layout => 'application-h'
  end
end 
