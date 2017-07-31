class CalendarController < ApplicationController
  def index
  	    end

  def show
  end

  def update
  byebug
  


  end





  private

  def user_specific
    @user = User.find(params[:id])
  end







end
