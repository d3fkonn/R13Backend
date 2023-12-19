class CouriersController < ApplicationController
    skip_before_action :verify_authenticity_token

  def new
  end

  def create
    @courier = Courier.new(courier_params)

    respond_to do |format|
      if @courier.save
        format.html { redirect_to courier_url(@courier), notice: "courier was successfully created." }
        format.json { render :show, status: :created, location: @courier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @courier.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    id = params[:id]
    data = JSON.parse(request.body.read)
    email = data["email"]
    address_id = data["address_id"]
    user_id = data["user_id"]
    active = data["active"]
    phone = data["phone"]

    @courier = Courier.find_by(id: id)
    if @courier.update(email: email, phone: phone, address_id: address_id, user_id: user_id, active: active)
      render json: @courier
    else
      render json: { errors: @courier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    id = params[:id]
    @courier = Courier.find_by(id: id)
    if @courier
      render json: @courier
      return;
    else
      render json: { error: "Courier with ID #{id} not found." }, status: :not_found
    end
  end
  
  private
  def courier_params
    params.permit(:user_id, :address_id, :phone, :email, :active)
  end

end
