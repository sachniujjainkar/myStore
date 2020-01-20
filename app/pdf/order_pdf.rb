require 'prawn'
class OrderPdf < Prawn::Document
  def initialize(order)
    super()

    @order = order
    content
    products
  end

  def content
    text "MYShopee", :size => 20,style: :bold,:align => :right 
    text "Order Invoice", :size => 30, :align => :center
    text "Invoice ID:  AT-#{rand(10..100)}-#{rand(100..1000)}", size: 16, style: :bold
    text "Order no: #{@order.order_no}", size: 16, style: :bold
    text "Delivery Date : #{@order.delivery_date.to_formatted_s(:rfc822)}",size: 16, style: :bold
    move_down 5
    stroke_horizontal_rule
    move_down 5
    text "Customer Details", size: 15, style: :bold
    move_down 5
    text "Customer name:", size: 12, style: :bold 
    text "#{@order.user.firstname}  #{@order.user.lastname}"
    move_down 5
    text "Billing Address: ", size: 12, style: :bold
    text  "#{@order.address.line1}"
    text  "#{@order.address.line2}"
    text  " #{@order.address.city}, #{@order.address.state}"
    text  " #{@order.address.country},#{@order.address.zip_code}"
    move_down 10
    stroke_horizontal_rule
    move_down 20

    text "Order Details", size: 15, style: :bold
    move_down 5
    text "Delivery Date :", style: :bold 
    text " #{@order.delivery_date.to_formatted_s(:rfc822)}"
    text "Special Instruction :", style: :bold
    text " #{@order.special_instruction}"
    text "Tracking Number :", style: :bold
    text "#{@order.tracking_number}"
    
    move_down 10
    stroke_horizontal_rule
    move_down 20
    
    text "Products", size: 15, style: :bold
    
    table products do
      row(0).font_style = :bold
      columns(1..4).align = :right
      self.header = true
    end

    move_down 50
    stroke_horizontal_rule
    move_down 10
    text "Sub Total: #{@order.order_total}", style: :bold, align: :right
      
  end


 
  def products
     # byebug
    [["Name","Qty", "Price", "Total"]] +
    
    @order.order_products.map do |item|
      
      [item.product.name, item.product.quantity, item.product.price,item.product.quantity * item.product.price]
    
    end
  end
  

end

