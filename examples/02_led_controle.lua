-- Controle manual de LED no D1 (GPIO5)
local LED = 5
gpio.mode(LED, gpio.OUTPUT)

gpio.write(LED, gpio.HIGH) -- liga
-- gpio.write(LED, gpio.LOW) -- desliga

