class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token


  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1 or /customers/1.json
  def show
    id = params[:id]
    @customer = Customer.find_by(id: id)
    if @customer
      render json: @customer
      return;
    else
      render json: { error: "Customer with ID #{id} not found." }, status: :not_found
    end
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.create(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    id = params[:id]
    data = JSON.parse(request.body.read)
    email = data["email"]
    address_id = data["address_id"]
    user_id = data["user_id"]
    active = data["active"]
    phone = data["phone"]

    @customer = Customer.find_by(id: id)
    if @customer.update(email: email, phone: phone, address_id: address_id, user_id: user_id, active: active)
      render json: @customer
    else
      render json: { errors: @customer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:user_id, :address_id, :phone, :email, :active)
    end
end
