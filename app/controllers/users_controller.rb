class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update]
  before_action :need_permission, only: %i[edit update]

  def show
    @discussions = @user.discussions.includes(:anime).order(created_at: :desc).page(params[:page])
    @comments = @user.comments.includes(discussion: :anime).order(created_at: :desc).page(params[:page])
  end

  def edit; end

  def update; end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def need_permission
      redirect_to user_path(@user) unless current_user.id == @user.id
    end
end
