class ExpenseCategoryController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense_category, only: [:show, :edit, :update, :destroy]

  # GET /expense_category
  # GET /expense_category.json
  def index
    @expense_category = current_user.expense_category.all
  end

  # GET /expense_category/1
  # GET /expense_category/1.json
  def show
  end

  # GET /expense_category/new
  def new
    @expense_category = ExpenseCategory.new
  end

  # GET /expense_category/1/edit
  def edit
  end

  # POST /expense_category
  # POST /expense_category.json
  def create
    @expense_category = ExpenseCategory.new(expense_category_params)
    @expense_category.user_id=current_user.id

    respond_to do |format|
      if @expense_category.save
        format.html { redirect_to @expense_category, notice: 'Expense category was successfully created.' }
        format.json { render :show, status: :created, location: @expense_category }
      else
        format.html { render :new }
        format.json { render json: @expense_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_category/1
  # PATCH/PUT /expense_category/1.json
  def update
    respond_to do |format|
      if @expense_category.update(expense_category_params)
        format.html { redirect_to @expense_category, notice: 'Expense category was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_category }
      else
        format.html { render :edit }
        format.json { render json: @expense_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_category/1
  # DELETE /expense_category/1.json
  def destroy
    @expense_category.destroy
    respond_to do |format|
      format.html { redirect_to expense_category_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_category
      # @expense_category = ExpenseCategory.where(:id => params[:id], :user_id => current_user.id).first
      unless @expense_category = current_user.expense_category.where(id: params[:id]).first
        flash[:alert] = 'Expense not found.'
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_category_params
      params.require(:expense_category).permit(:title, :description)
    end
end
