class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def show
    @task =Task.find(params[:id])
  end
  def new
    @task=Task.new
  end
  def create
    @task= Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task successfully created!"
    else
      render :new, status: :unprocessable_entity

    end
  end
  def edit
    @task = Task.find(params[:id])

  end
  def update
    @task= Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
