class UsersController < ApplicationController
   #redundancy reduction
   before_action :set_user, only: [:edit, :update, :show]
   before_action :require_same_user, only: [:edit, :update, :destroy]
   before_action :require_admin, only: [:destroy]
       
   #define index
   def index
      @users = User.paginate(page: params[:page], per_page: 5)
   end
   #define new
   def new
        @user = User.new
   end
   #define create
   def create
      @user = User.new(user_params) 
      if @user.save
          session[:user_id] = @user.id
          flash[:success] = "Welcome to the Sebastian's Blog #{@user.username}"
          redirect_to user_path(@user)
      else
          render 'new'
      end
      
   end
    #define exit
   def edit
   end
   
   #define update
   def update
       if @user.update(user_params)
           flash[:success] = "Your account has been updated"
           redirect_to articles_path
           
       else
           render 'edit'
       end
       
   end
   #define show
   def show
      @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
   end
   
   def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:danger] = "User and all articles have been deleted"
      redirect_to users_path
      
   end
   
   private
   def user_params
       params.require(:user).permit(:username, :email, :password)
   end
   #set user methodsss
   def set_user
      @user = User.find(params[:id])
   end
   
   def require_same_user
      if current_user != @user and !current_user.admin?
         flash[:danger] = "You can only edit your own account!"
         redirect_to root_path
      end
   end
   
   def require_admin
      if logged_in? and !current_user.admin?
         flash[:danger] = "Only admin users can complete this action"
         redirect_to root_path
      end
   end
end