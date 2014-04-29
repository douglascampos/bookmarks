class PasswordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_password, only: [:show, :edit, :update, :destroy]

  # GET /passwords
  # GET /passwords.json
  def index
    @passwords = current_user.passwords
  end

  # GET /passwords/1
  # GET /passwords/1.json
  def show
  end

  # GET /passwords/new
  def new
    @password = Password.new
    @category =  current_user.password_category
  end

  # GET /passwords/1/edit
  def edit
     @category =  current_user.password_category.all
  end

  # POST /passwords
  # POST /passwords.json
  def create
    @password = Password.new(password_params)
    @password.user_id=current_user.id

    respond_to do |format|
      if @password.save
        format.html { redirect_to @password, notice: 'Password was successfully created.' }
        format.json { render :show, status: :created, location: @password }
      else
        format.html { render :new }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passwords/1
  # PATCH/PUT /passwords/1.json
  def update
    respond_to do |format|
      if @password.update(password_params)
        format.html { redirect_to @password, notice: 'Password was successfully updated.' }
        format.json { render :show, status: :ok, location: @password }
      else
        format.html { render :edit }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passwords/1
  # DELETE /passwords/1.json
  def destroy
    @password.destroy
    respond_to do |format|
      format.html { redirect_to passwords_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_password
      # @password = Password.find(params[:id])
      unless @password = current_user.passwords.where(id: params[:id]).first
       flash[:alert] = 'Password not found.'
       redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def password_params
      params.require(:password).permit(:login, :pass, :url, :obs, :PasswordCategory_id)
    end
end
