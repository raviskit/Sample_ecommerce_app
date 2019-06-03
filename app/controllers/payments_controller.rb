class PaymentsController < ApplicationController
  def create
    @phone_number = current_user
    current_user.generate_pin
    current_user.send_pin
    respond_to do |format|
      format.js # render app/views/phone_numbers/create.js.erb
    end
  end
  def verify
    @phone_number = current_user
    if @phone_number.verify(params[:pin])
      current_user.orders.create!(product_id: current_order.product_id)
      current_order.update({user: current_user})
      current_order.order_items.update({order_id: nil})
    end
    respond_to do |format|
      format.js
    end
  end
end
