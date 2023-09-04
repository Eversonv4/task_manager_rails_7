class TasksController < ApplicationController
  before_action :set_task, only: %i[ edit update destroy ]

  def index
    @tasks = Task.only_parents.order(due_date: :desc)
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: "Tarefa criada com sucesso." }
      else
        flash.now[:alert] = @task.errors.full_messages.to_sentence
        format.html { render :new, status: :unprocessable_entity  }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: "Tarefa foi atualizada com sucesso." }
      else
        flash.now[:alert] = @task.errors.full_messages.to_sentence
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end 

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Tarefa foi removida com sucesso." }
    end
  end


  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :due_date, :done)
    end
end
