require 'json'
require 'rest-client'

release = {
  cookie: 'FILL_ME_IN',
  csrftoken: 'FILL_ME_IN',
  email: 'FILL_ME_IN',
  username: 'FILL_ME_IN',
}
capture = {
  cookie: 'FILL_ME_IN',
  csrftoken: 'FILL_ME_IN',
  email: 'FILL_ME_IN',
  username: 'FILL_ME_IN',
}
recapture = release.merge({
  username: 'FILL_ME_IN',
})

def change_username(args)
  response = RestClient.post("https://www.instagram.com/accounts/edit/",
    {
      first_name: 'FILL_ME_IN',
      email: args[:email],
      username: args[:username],
      phone_number: 'FILL_ME_IN',
      gender: 'FILL_ME_IN',
      biography: 'FILL_ME_IN',
      external_url: 'FILL_ME_IN',
      chaining_enabled: 'on',
    },
    headers={
      cookie: args[:cookie],
      origin: 'https://www.instagram.com',
      :'accept-encoding' => 'gzip, deflate, br',
      :'accept-language' => 'en-US,en;q=0.8',
      :'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36',
      :'x-requested-with' => 'XMLHttpRequest',
      :'x-csrftoken' => args[:csrftoken],
      :'x-instagram-ajax' => '1',
      :'content-type' => 'application/x-www-form-urlencoded',
      accept: '*/*',
      referer: 'https://www.instagram.com/accounts/edit/',
      authority: 'www.instagram.com',
    }
  )
  result = JSON.parse(response.body)
  puts "result.inspect: #{result.inspect}"
  unless result['status'] == 'ok'
    raise "FAILURE!!"
  end
  true
end

begin
  change_username(release)
  puts "RELEASED!"
  begin
    while true
      break if change_username(capture)
    end
    puts "CAPTURED!"
  rescue
    retry
  end

  change_username(recapture)
  puts "RECAPTURED!"
rescue Exception => err
  puts err.inspect
  puts err.response.inspect
  puts err.response.body
end
