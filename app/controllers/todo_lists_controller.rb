class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    @todo_lists = TodoList.all
  end

  def show
  end

  def new
    @todo_list = TodoList.new
  end

  def edit
  end

  def create
    @todo_list = TodoList.new(todo_list_params)

    if @todo_list.save
      redirect_to todo_lists_path, notice: 'Todo list was successfully updated.'
    else
      render :new
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      if @todo_list.list_items.all?(&:done)
        @todo_list.update(done: true)
      end
      redirect_to todo_lists_path, notice: 'Todo list was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @todo_list.destroy
    redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.'
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(:title, :color, :done)
  end
end
