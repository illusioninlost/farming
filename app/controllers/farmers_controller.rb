class FarmersController < ApplicationController
  before_action :set_farmer, only: [:show, :edit, :update, :destroy]

  
  def index
    @farmers = Farmer.all
  end

  
  def show
  end

  
  def new
    @farmer = Farmer.new
  end

  
  def edit
  end

 
  def create
    @farmer = Farmer.new(farmer_params)
    
    respond_to do |format|
      if @farmer.save
        format.html { redirect_to items_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @farmer }
      else
        format.html { render :new }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end
  end

  def log_in
    @farmer = Farmer.find_by(:username => params[:username])
    if @farmer && @farmer.authenticate(params[:password])
      session[:farmer_id]=@farmer.id
      redirect_to items_path
    else
      redirect_to new_farmer_path
    end
  end

  def update
    respond_to do |format|
      if @farmer.update(farmer_params)
        format.html { redirect_to @farmer, notice: 'Farmer was successfully updated.' }
        format.json { render :show, status: :ok, location: @farmer }
      else
        format.html { render :edit }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @farmer.destroy
    respond_to do |format|
      format.html { redirect_to farmers_url, notice: 'Farmer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_farmer
      @farmer = Farmer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farmer_params
      params.require(:farmer).permit(:username, :name, :password)
    end
end
