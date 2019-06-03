class AddColToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :otp, :string
    add_column :users, :otp_verified, :boolean
  end
end
