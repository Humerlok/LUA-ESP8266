-- Buzzer passivo no D2 (GPIO4)
local BUZZER = 4

pwm.setup(BUZZER, 2000, 512)
pwm.start(BUZZER)

tmr.create():alarm(500, tmr.ALARM_SINGLE, function()
  pwm.stop(BUZZER)
end)

-- Para um buzzer ativo, use em vez do PWM:
-- gpio.mode(BUZZER, gpio.OUTPUT)
-- gpio.write(BUZZER, gpio.HIGH)

