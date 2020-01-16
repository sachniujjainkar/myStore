class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  # before_action :require_same_user, only [:edit, :show, :update ,:destroy]
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    # @orders = Order.all.paginate(page: params[:page], per_page:5)
    # @orders = Order.paginate(page: params[:page], per_page:5)   
   
 
  end

  # GET /orders/1
  # GET /orders/1.json
  def show

    respond_to do |format|
      # // some other formats like: format.html { render :show }
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Hellow World!"
        send_data pdf.render 
       end
    end

  end

  # GET /orders/new
  def new
    @products = Product.all
    @order = Order.new
    @order.order_products.new
    byebug
  end

  # GET /orders/1/edit
  def edit
    @products = Product.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    byebug
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def add_product
    respond_to do |format|               
      format.js
    end        
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      raise ActionController::RoutingError.new('Not Found') if @order.blank?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_no, :delivery_date, :special_instruction, :tracking_number, :order_total, :discount,:user_id,:address_id, order_products_attributes: [:quntity, :product_id, :_destroy])
    end

    # def require_same_user
    #   if current_user != @user   
    #     flash[:danger] = "You can only edit your own account"
    #     redirect_to root_path
    #   end
    # end

  end
