-- Pisca-pisca de LED externo no D1 (GPIO5)
local LED = 5
gpio.mode(LED, gpio.OUTPUT)

local ligado = false
tmr.create():alarm(1000, tmr.ALARM_AUTO, function()
  ligado = not ligado
  gpio.write(LED, ligado and gpio.HIGH or gpio.LOW)
end)

