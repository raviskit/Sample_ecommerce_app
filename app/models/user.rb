class User < ApplicationRecord
  Authy.api_key = 'HpmjUNMXCTLRUnbIOAz74qUY7cLz6z7B'
  Authy.api_uri = 'https://api.authy.com/'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :phone_number, presence: true #, uniqueness: true
  validates :country_code, presence: true
  validates :email, presence: true, uniqueness: true, exclusion: { in: %w(admin superuser) }
  has_many :orders
  has_many :products, through: :orders
  Roles = [ :admin , :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  def generate_pin
    self.otp = rand(0000..9999).to_s.rjust(4, "0")
    save
  end

   def send_pin
     begin
       phnumber = "+" + country_code + phone_number unless country_code.match("\\+")
       twilio_client.messages.create( to: phnumber, from: "+12015094847", body: "Your PIN is #{otp}")
     rescue Exception => e
       result = AuthyJob.perform_now(phone_number, country_code, email)
       update({authy_id: result[1]["user"]["id"]})
       Authy::API.request_sms(:id => authy_id, :force => true).ok?
      end
    end
   def twilio_client
     Twilio::REST::Client.new('AC66ded78359d956172d423fb8f095f568', 'e25ee039ee48b712ec57f4f65e080e94')
   end
   def verify(entered_pin)
     if self.otp == entered_pin or Authy::API.verify(:id => authy_id, :token => entered_pin, :force => true).ok?
       update_columns(otp_verified: true)
   end
  end
end
