class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:new, :edit, :destroy]
  before_action :no_edit_or_destroy, only: [:edit, :destroy]
  def index
    @items = Item.all
  end

  
  def show
  end
  
  def new
    @item = Item.new
  end

  
  def edit
  end

# when there is an error in validation, how to add errors to the object
  def create
    @current_user = Farmer.find(session[:farmer_id]) if session[:farmer_id]
    @current_user.items.create!(item_params)
    flash[:notice] = 'Item was successfully created.' 
     redirect_to items_path
  end

  
  def update
    @current_user = Farmer.find(session[:farmer_id]) if session[:farmer_id]
    @current_user.items.find_by(id: params[:id]).update(item_params)
    flash[:notice] = 'Item was successfully updated.' 
     redirect_to items_path
  end


  def destroy
    @current_user = Farmer.find(session[:farmer_id]) if session[:farmer_id]
    @current_user.items.find_by(id: params[:id]).destroy
    flash[:notice] = 'Item was successfully destroyed.' 
    redirect_to items_path
  end

  private
    def check_user
      @current_user = Farmer.find(session[:farmer_id]) if session[:farmer_id]
      if @current_user == nil
        flash[:notice] = "Please log in or sign up."
        redirect_to items_path
      end
    end

    def no_edit_or_destroy
      @current_user = Farmer.find(session[:farmer_id]) if session[:farmer_id]
      if @current_user.items.find_by(id: params[:id]) == nil
        flash[:notice] = "Please edit or delete your own product"
        redirect_to items_path
      end
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :value, :weight, :location)
    end
end
