class EventNoticesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])

  end

  def sent
  end


end
