class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update]
  before_action :need_permission, only: %i[edit update]

  def show
    @discussions = @user.discussions.includes(:anime).order(created_at: :desc).page(params[:page])
    @comments = @user.comments.includes(discussion: :anime).order(created_at: :desc).page(params[:page])
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash.now[:alert] = @user.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def set_user
      @user = User.with_deleted.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :avatar)
    end

    def need_permission
      redirect_to user_path(@user) unless current_user.id == @user.id
    end
end
