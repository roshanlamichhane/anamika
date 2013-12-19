class ItemsController < ApplicationController
	def index
		@items = Item.all
	end
	def new
		@item = Item.new
		
  end
  def show
  	id= params[:id]
 	@item = Item.find(id)
  end
 
  def create
  	item = item_params
	Item.create(item)
	redirect_to action: :index
  end

  def edit 
  	@item = Item.find(params[:id])
  end

  def update
	@item = Item.find(params[:id])
	@item.update_attributes(item_params)
	redirect_to item_path(@item)  	
  end
  def destroy
  @item = Item.find(params[:id])
  @item.destroy
  redirect_to items_path
end

   def item_params
     	params.require(:item).permit(:name, :quantity, :quality)
    end
end
