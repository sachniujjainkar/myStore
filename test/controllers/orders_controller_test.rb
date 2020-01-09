require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { delivery_date: @order.delivery_date, discount: @order.discount, order-total: @order.order-total, order_no: @order.order_no, product_id: @order.product_id, special_instruction: @order.special_instruction, tracking_number: @order.tracking_number } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { delivery_date: @order.delivery_date, discount: @order.discount, order-total: @order.order-total, order_no: @order.order_no, product_id: @order.product_id, special_instruction: @order.special_instruction, tracking_number: @order.tracking_number } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
