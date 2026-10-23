-- Controle de módulo relé no D1 (GPIO5)
-- Muitos módulos são acionados em nível LOW. Ajuste RELE_LIGADO se necessário.
local RELE = 5
local RELE_LIGADO = gpio.LOW
local RELE_DESLIGADO = gpio.HIGH

gpio.mode(RELE, gpio.OUTPUT)
gpio.write(RELE, RELE_DESLIGADO)

-- Para ligar: gpio.write(RELE, RELE_LIGADO)
-- Para desligar: gpio.write(RELE, RELE_DESLIGADO)

