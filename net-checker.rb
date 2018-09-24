gem 'net-ping'
require 'net/ping'

while true
  sleep 60
  check = Net::Ping::External.new("google.com")
  next if check.ping?
  `sudo ifconfig wlan0 down` 
  `sudo ifconfig wlan0 up`  
end

