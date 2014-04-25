class CategoryController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /category
  # GET /category.json
  def index
    ##########
    @category = current_user.category
  end

  # GET /category/1
  # GET /category/1.json
  def show
  end

  # GET /category/new
  def new
    @category = Category.new
  end

  # GET /category/1/edit
  def edit
  end

  # POST /category
  # POST /category.json
  def create
    @category = Category.new(category_params)
    @category.user_id=current_user.id
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Categorie was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category/1
  # PATCH/PUT /category/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_index_path, notice: 'Categorie was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category/1
  # DELETE /category/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      #######
      format.html { redirect_to category_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      # @category = Category.find(params[:id])
      #######
      unless @category = current_user.category.where(id: params[:id]).first
        flash[:alert] = 'Category not found.'
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:title, :description, :id)
    end
end
