require_relative "./smooth.rb"
include Smooth

end_time = Time.now + 3600

while Time.now < end_time 
  transition from: "FF0000", to: "00FF00"
  sleep 0.4
  transition from: "00FF00", to: "0000FF"
  sleep 0.4
  transition from: "0000FF", to: "FF0000"
  sleep 0.4
end

transition from: "000000", to: "000000"

