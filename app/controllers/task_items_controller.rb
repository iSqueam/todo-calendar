class TaskItemsController < ApplicationController
    before_action :set_task_list
    before_action :set_task_item, only: [:edit, :update, :destroy, :show]
    attr_reader :user
    def create
        @task_item = @task_list.task_items.create(task_item_params)
        respond_to do |format|
            if @task_item.save
                format.html{ redirect_to task_list_url(@task_item), notice: "Task Item Created."}
                format.json{ render :show, status: :ok, loation: @task_list}
            else
                format.html{ render :show, status: :unprocessable_entity }
                format.json{ render json: @task_item.errors, status: :unprocessable_entity }
            end
        end     
    end

    def show
        @task_item = @task_list.task_items.find(params[:id])
    end

    def set_task_list
     @task_list = TaskList.find(params[:task_list_id])
    end

    def set_task_item
        @task_item = TaskItem.find(params[:id])
    end

    def update
        respond_to do |format|
            if @task_item.update(task_item_params)
            format.html { redirect_to task_list_task_item_url(@task_list, @task_item), notice: "Task Item was successfully updated." }
            format.json { render :show, status: :ok, location: @task_list }
            else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @task_item.errors, status: :unprocessable_entity }
            end
        end
    end

    def new
        @task_item = @task_list.task_items.build
    end

    def edit
    end

    def destroy
        respond_to do |format|
            @task_item = @task_list.task_items.find(params[:id])
            if @task_item.destroy
                format.html{redirect_to task_list_url(@task_list), notice: "Task Item was deleted"}
                format.json{render :show, status: :ok, location: @task_list}
            else
                format.html{render :edit, status: :unprocessable_entity}
                format.json{render json: @task_item.errors, status: :unprocessable_entity}
            end
        end
    end

    def task_item_params
        params[:task_item].permit(:content, :description, :date, :priority, :completed)
    end

end
