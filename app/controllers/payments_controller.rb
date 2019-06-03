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
    @phone_number.verify(params[:pin])
    respond_to do |format|
      format.js
    end
  end
end
