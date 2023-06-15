class ListItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_list_item, only: [:show, :edit, :update, :destroy]

  def index
    @list_items = @todo_list.list_items.all
  end

  def show
  end

  def new
    @list_item = @todo_list.list_items.new
  end

  def edit
  end

  def create
    @list_item = @todo_list.list_items.new(list_item_params)

    if @list_item.save
      redirect_to [@todo_list, @list_item], notice: 'List item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @list_item.update(list_item_params)
      redirect_to [@todo_list, @list_item], notice: 'List item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @list_item.destroy
    redirect_to todo_list_list_items_url(@todo_list), notice: 'List item was successfully destroyed.'
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_list_item
    @list_item = @todo_list.list_items.find(params[:id])
  end

  def list_item_params
    params.require(:list_item).permit(:title, :priority, :due_date, :done)
  end
end
