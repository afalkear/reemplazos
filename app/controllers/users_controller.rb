class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @user }
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.json { render json: @users }
      else
        format.json { render json: @users.errors.to_a,
                             status: :unprocessable_entity }
      end
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def create
  end

  def destroy

  end
end
