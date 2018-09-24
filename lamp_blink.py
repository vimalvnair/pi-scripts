import sys
import time
import RPi.GPIO as GPIO
GPIO.setmode(GPIO.BCM)

LAMP_PIN = 3
GPIO.setup(LAMP_PIN, GPIO.OUT, initial = 1)

blink_times = int(sys.argv[1])
delay = int(sys.argv[2])

i = 0
while i < blink_times:
    GPIO.output(LAMP_PIN, 0)
    time.sleep(delay/1000.0/2.0)
    GPIO.output(LAMP_PIN, 1)
    time.sleep(delay/1000.0/2.0)
    i += 1

