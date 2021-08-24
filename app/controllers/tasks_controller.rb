class TasksController < ApplicationController

  before_action :set_task, only: %i[edit update destroy]
  before_action :require_same_user, only: %i[edit update destroy]
  
  def index
    @tasks = Task.all
    if params[:category].blank?

    else
      @category_id = Category.find_by(name: params[:category]).id
    end
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(allowed_params) 
    if @task.save
      flash[:success] = 'Task created'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @task.update_attributes(allowed_params)
      flash[:success] = 'Task Updated '
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    flash[:danger] = 'Deleted'
    redirect_to tasks_path
  end

  private

  def allowed_params
    params.require(:task).permit(:title, :description,:company_name, :location,:estimated_date,:category_id,:user_id)
  end
end