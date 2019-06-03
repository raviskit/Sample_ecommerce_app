class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  Roles = [ :admin , :default ]
  def is?( requested_role )
   self.role == requested_role.to_s
  end

  def generate_pin
      self.otp = rand(0000..9999).to_s.rjust(4, "0")
      save
   end
   
   def send_pin
     twilio_client.messages.create(
     to: phone_number,
     from: "+12015094847",
     body: "Your PIN is #{otp}"
     )
   end

   def twilio_client
     Twilio::REST::Client.new('AC66ded78359d956172d423fb8f095f568', 'e25ee039ee48b712ec57f4f65e080e94')
   end

   def verify(entered_pin)
     update(otp_verified: true) if self.otp == entered_pin
   end
end
