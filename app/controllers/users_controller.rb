class UsersController < ApplicationController
  # 認証をスキップ: サインアップ（new, create）はログイン前に行うため
  allow_unauthenticated_access only: [:new, :create, :show,] 
 
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      # ユーザー登録成功後、ログイン画面へリダイレクト
      redirect_to new_session_path, notice: "ユーザー登録が完了しました！続けてログインしてください。"
    else
      # エラー時はフォームを再表示
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images    
  end

    def edit
    @user = User.find(params[:id])
  end

    def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)  
  end

  private
 
  def user_params
    # name, email_address, password, password_confirmation を許可
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :profile_image)
  end
end
