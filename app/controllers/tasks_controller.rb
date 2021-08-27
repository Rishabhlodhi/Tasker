class TasksController < ApplicationController

  def index
    #byebug
    if params[:category].blank?
      @tasks = Task.all.paginate(page: params[:page], per_page: 2)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @tasks =Task.where(category_id: @category_id).paginate(page: params[:page], per_page: 2)

    end
  end
  
  def show
      @task = Task.find(params[:id]) 
      @user_tasks = @task.user.tasks.paginate(page: params[:page],per_page: 2)  
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    #byebug
    @task = current_user.tasks.build(allowed_params) 
    if @task.save
      flash[:success] = 'Task created'
      redirect_to '/tasks'
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to '/tasks'
  end


  def allowed_params
    params.require(:task).permit(:title, :description, :company_name, :location, :estimated_date, :category_id,:user_id)
  end
  #def task_params
    #params.permit(:title, :description,:company_name, :location,:estimated_date, :category_id, :user_id)
  #end


end