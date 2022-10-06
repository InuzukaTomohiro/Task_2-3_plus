class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def index
    @groups = Group.all

    @book = Book.new
  end

  def show
  end

  def edit
  end

  def create

  end

  def update
  end



  private
  def group_params
    params.require(:group).permit(:name, :introduce, :group_image)
  end

end
