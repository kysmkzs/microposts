class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 保存に成功した場合はユーザーページへリダイレクト
      redirect_to edit_user_path , notice: 'プロフィールを更新しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :area, :web, :bd, :password,
                                 :password_confirmation)
  end
end