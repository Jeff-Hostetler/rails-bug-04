class TasksController < ApplicationController

  before_action do
    @task_list = TaskList.find(params[:task_list_id])
  end

  def new
    @task = Task.new
  end

  def create
    task_params = params.require(:task).permit(:description, :due_date, :task_list_id)
    @task = @task_list.tasks.new(task_params)
    if @task.save
      redirect_to root_path, notice: "Task was created successfully!"
    else
      render :new
    end
  end

end
