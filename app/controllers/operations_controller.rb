class OperationsController < ApplicationController
  before_action :set_operation, only: %i[ show edit update destroy ]
  before_action :get_categories
  # GET /operations or /operations.json
  def index
    @operations = Operation.all
    # @category = Category.find(params[:category_id])
    # @expenses = @category.expenses.where(user_id: current_user.id).order('created_at DESC')
  end
def show_operations
   @operation = Operation.new
end
  # GET /operations/1 or /operations/1.json
  def show
  end

  # GET /operations/new
  def new
    # @operation = @category.operations.build
    @operation = Operation.new
  end

  # GET /operations/1/edit
  def edit
  end

  # POST /operations or /operations.json
  def create
    @operation = Operation.new(operation_params)

    respond_to do |format|
      if @operation.save
        format.html { redirect_to operation_url(@operation)}
        # format.html { redirect_to category_operations_path(@category), notice: "Operation was successfully created." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        # format.html { redirect_to operation_url(@operation),
        format.html { redirect_to operation_path(@operation), notice: "Operation was successfully updated." }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
   
    @operation.destroy 

    respond_to do |format|
      # format.html { redirect_to operations_url
      format.html { redirect_to category_operations_path(@category), notice: "Operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_categories
      @categories = Category.all.order(:name)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      # @operation = @category.operations.find(params[:id])
       @operation = Operation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operation_params
      params.require(:operation).permit(:amount, :odate, :description, :category_name, :category_id)
    end
end
