class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show]

  def show
    @discussions = @user.discussions.order(created_at: :desc).page(params[:page])
    @comments = @user.comments.order(created_at: :desc).page(params[:page])
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
