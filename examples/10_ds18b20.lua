-- Sensor de temperatura DS18B20 no D2 (GPIO4)
-- Requer o módulo/driver ds18b20.lua no ESP8266.
-- Use resistor de 4,7 kohm entre DATA e 3,3 V.
local pino = 4

local ds18b20 = require("ds18b20")
ds18b20.setup(pino)

tmr.create():alarm(2000, tmr.ALARM_AUTO, function()
  ds18b20.read(nil, function(_, temperatura)
    print("Temperatura: " .. temperatura .. " C")
  end)
end)

