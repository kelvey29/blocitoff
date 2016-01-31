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
  
  def destroy
    @item = current_user.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item removed"
    else
      flash[:alert] = "Item couldn't be deleted, try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name)
  end
end
