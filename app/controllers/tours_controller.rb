class ToursController < ApplicationController

  def destroy
    if params[:id] and User.current.logged?
      User.current.pref["redmine_tour_#{params[:id]}"] = false
      if User.current.pref.save!
        render :status => 204, :nothing => true
      else
        render :status => 400, :nothing => true
      end
    end
  end  

  def create
    if params[:tour] and User.current.logged?
      User.current.pref["redmine_tour_#{params[:tour]}"] = true
      if User.current.pref.save!
        render :status => 201, :nothing => true
      else
        render :status => 400, :nothing => true
      end
    end
  end
end