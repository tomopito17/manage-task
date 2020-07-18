class TasksController < ApplicationController
  #before_action :set_user
  #before_action :set_task, only: %i(show edit update destroy)
  #before_action :logged_in_user
  #obefore_action :correct_user #C6
  
  def index
    #@tasks = Task.all  #C6 del
    @user = User.find(params[:user_id])#C6
    @tasks = @user.tasks
  end
  
  def show
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new#C4 Add original
  end
  
  def create
    @user= User.find(params[:user_id]) #C6opt
    @task = @user.tasks.new(task_params)#C6opt
    #@task = @User.new(params[user_id ])
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])#C8opt
    @user = User.find(params[:user_id])#C8opt
    #@user= User.find(params[:user_id]) 
  end
  
  def update
    @task = Task.find(params[:id])#C7opt
    @user = User.find(params[:user_id])#C7opt
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url(@user, @task)
    else
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])#C9opt
    @user = User.find(params[:user_id])#C9opt
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url @user
  end
  
  # def set_user
  #   @user = User.find(params[:user_id])
  # end
  
  # def set_task
  #   unless @task = @user.tasks.find_by(id: params[:id])
  #     flash[:danger] = "権限がありません。"
  #     redirect_to user_tasks_url @user
  #   end
  # end
  
  private#C6opt
  def task_params
    params.require(:task).permit(:name,:description)
  end
  
end
