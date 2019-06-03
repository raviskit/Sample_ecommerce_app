class AuthyJob < ActiveJob::Base

  def perform(user_contact, country_code, user_email)
     conn = Faraday.new(:url => 'https://api.authy.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
     end

    registered_user =   conn.post '/protected/json/users/new', { "api_key" => "HpmjUNMXCTLRUnbIOAz74qUY7cLz6z7B", "user[cellphone]" => "#{user_contact}", "user[email]" => "#{user_email}", "user[country_code]" => "#{country_code}" }
    _added_user = JSON.parse(registered_user.body)

    
     return [], _added_user
  end
end
