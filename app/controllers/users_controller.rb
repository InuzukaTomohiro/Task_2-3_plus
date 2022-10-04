class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @current_contact = Contact.where(user_id: current_user.id)
    @user_contact = Contact.where(use_id: @user.id)
    unless @user.id == current_user.id
      @current_contact.each do |cc|
        @user_contact.each do |uc|
          if cc.room_id == uc.room_id
            @isRoom = true
            @room_id = cc.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Contact.new
      end
    end
  end

  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
