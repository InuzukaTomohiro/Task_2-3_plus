class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @content = params[:content]
    if @content == "User"
      @users = User.looks(params[:type], params[:word])
    else
      @books = Book.looks(params[:type], params[:word])
    end
  end
end
