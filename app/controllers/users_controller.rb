class UsersController < ApplicationController
  
  def index
    @page_title="予定一覧"
    @users=User.all
  end

  def new
    @page_title="予定の新規作成"
    @user=User.new
  end
 
   def create
    @user=User.new(params.require(:user).permit(:title,:start_at,:end_at,:is_all_day,:memo))
    if @user.save
      flash[:notice]="スケジュールを登録しました"
      redirect_to users_path
    else
      flash.now[:alert]="スケジュールを登録できませんでした"
      render"new"
   end
  end
 
   def show
    @page_title="スケジュール詳細"
    @user=User.find(params[:id])
   end
 
   def edit
    @page_title="スケジュール編集"
    @user =User.find(params[:id])
   end
 
   def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title,:start_at,:end_at,:is_all_day,:memo))
      flash[:notice]="スケジュールを更新しました"
      redirect_to users_path
    
    else
      flash.now[:alert]="スケジュールを登録できませんでした"
      render"edit"
     end 
    end
  def destroy
    @user=User.find(params[:id])
    @user.destroy
    flash[:notice]="スケジュールを削除しました"
      redirect_to users_path
  end


   private 

  def user_params
  params.require(:user).permit(:title,:start_at,:end_at,:is_all_day,:memo)
  end
end
