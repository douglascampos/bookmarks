class PasswordCategoryController < ApplicationController
  before_action :authenticate_user!
  before_action :set_password_category, only: [:show, :edit, :update, :destroy]

  # GET /password_category
  # GET /password_category.json
  def index
    @password_category = PasswordCategory.all
  end

  # GET /password_category/1
  # GET /password_category/1.json
  def show
  end

  # GET /password_category/new
  def new
    @password_category = PasswordCategory.new
  end

  # GET /password_category/1/edit
  def edit
  end

  # POST /password_category
  # POST /password_category.json
  def create
    @password_category = PasswordCategory.new(password_category_params)

    respond_to do |format|
      if @password_category.save
        format.html { redirect_to @password_category, notice: 'Password category was successfully created.' }
        format.json { render :show, status: :created, location: @password_category }
      else
        format.html { render :new }
        format.json { render json: @password_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /password_category/1
  # PATCH/PUT /password_category/1.json
  def update
    respond_to do |format|
      if @password_category.update(password_category_params)
        format.html { redirect_to @password_category, notice: 'Password category was successfully updated.' }
        format.json { render :show, status: :ok, location: @password_category }
      else
        format.html { render :edit }
        format.json { render json: @password_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /password_category/1
  # DELETE /password_category/1.json
  def destroy
    @password_category.destroy
    respond_to do |format|
      format.html { redirect_to password_category_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_password_category
      @password_category = PasswordCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def password_category_params
      params.require(:password_category).permit(:titulo, :descricao)
    end
end
