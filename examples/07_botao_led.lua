-- Botão no D5 (GPIO14) controlando LED no D1 (GPIO5)
-- Ligue o botão entre D5 e GND; usamos resistor interno de pull-up.
local BOTAO = 14
local LED = 5
gpio.mode(BOTAO, gpio.INT, gpio.PULLUP)
gpio.mode(LED, gpio.OUTPUT)

local bloqueado = false
gpio.trig(BOTAO, "both", function(_, nivel)
  if bloqueado then return end
  bloqueado = true
  gpio.write(LED, nivel == gpio.LOW and gpio.HIGH or gpio.LOW)
  tmr.create():alarm(150, tmr.ALARM_SINGLE, function()
    bloqueado = false
  end)
end)

