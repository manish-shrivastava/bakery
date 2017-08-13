class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_customer

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
    @order_items = @order.order_items
  end

  # GET /orders/new
  def new
    @order = Order.new(customer: @customer)
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params.merge(customer: @customer))

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /orders/1
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def set_customer
      @customer = Customer.first
    end

    def order_params
      params.require(:order).permit(:customer_id)
    end
end
