RED_PIN=17
GREEN_PIN=18
BLUE_PIN=22

[RED_PIN, BLUE_PIN, GREEN_PIN].cycle do|pin|
  `echo "#{pin}=1" > /dev/pi-blaster`
  sleep 0.05
  `echo "#{pin}=0" > /dev/pi-blaster`
end
