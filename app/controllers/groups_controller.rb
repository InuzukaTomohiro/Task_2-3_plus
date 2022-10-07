class GroupsController < ApplicationController
   before_action :ensure_correct_user, only: [:edit,:update]


  def new
    @group = Group.new
  end

  def index
    @groups = Group.all

    @book = Book.new
  end

  def show
    @book = Book.new
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    group = Group.new(group_params)
    group.owner_id = current_user.id
    group.save
    redirect_to "/groups"

  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to "/groups"
  end



  private
  def group_params
    params.require(:group).permit(:name, :introduce, :group_image)
  end

  def ensure_correct_user
    group = Group.find(params[:id])
    unless group.owner_id == current_user.id
      redirect_to "/groups"
    end
  end

end
