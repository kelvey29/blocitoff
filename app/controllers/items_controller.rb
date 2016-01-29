class ItemsController < ApplicationController
  def create
    @item = current_user.items.new(item_params)
    
    if @item.save
      redirect_to user_path(current_user), notice: "Task saved successfully"
    else
      flash[:error] = "Save failed, please try again"
      redirect_to root_path
    end
    
  end
  
  private
  def item_params
    params.require(:item).permit(:name)
  end
end
