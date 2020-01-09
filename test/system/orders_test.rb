require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Delivery date", with: @order.delivery_date
    fill_in "Discount", with: @order.discount
    fill_in "Order-total", with: @order.order-total
    fill_in "Order no", with: @order.order_no
    fill_in "Product", with: @order.product_id
    fill_in "Special instruction", with: @order.special_instruction
    fill_in "Tracking number", with: @order.tracking_number
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Delivery date", with: @order.delivery_date
    fill_in "Discount", with: @order.discount
    fill_in "Order-total", with: @order.order-total
    fill_in "Order no", with: @order.order_no
    fill_in "Product", with: @order.product_id
    fill_in "Special instruction", with: @order.special_instruction
    fill_in "Tracking number", with: @order.tracking_number
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
