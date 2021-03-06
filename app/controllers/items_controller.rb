require 'pry'
class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:new, :edit, :destroy]
  before_action :no_edit_or_destroy, only: [:edit, :destroy]
  
  def index
    @items = Item.all
    respond_to do |format|
      format.html 
      format.json {render json: @items}
    end

  end

  
  def show
    respond_to do |format|
      format.html 
      format.json {render json: @item}
    end

  end
  
  def new
    @item = Item.new
  end

  
  def edit
  end

# when there is an error in validation, how to add errors to the object
  def create
    @current_user = Farmer.find(session[:farmer_id]) if session[:farmer_id]
    if @current_user.items.create(item_params).valid?
      @current_user.items.create(item_params)
      flash[:notice] = 'Item was successfully created.'
      redirect_to items_path
      # begin
      #   @current_user.items.create!(item_params)
      # rescue ActiveRecord::RecordInvalid => invalid
      #   redirect_to new_item_path(invalid.record)
      # end
    else
      redirect_to new_item_path
    end
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

  def add
    @item = Item.find(params[:id])
    
    @comment = Comment.new(content: params[:content])
    @item.comments << @comment
    @comment.save
 
    # redirect_to item_path(@item)
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

    def comment_params
      params.require(:comment).permit(:content)
    end
end
