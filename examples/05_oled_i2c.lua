-- OLED I2C SSD1306 128x64
-- SDA = D2/GPIO4, SCL = D1/GPIO5
-- Requer o arquivo ssd1306.lua do driver usado pelo seu display.

i2c.setup(0, 4, 5, i2c.SLOW)

-- Muitos drivers NodeMCU usam uma destas formas:
-- disp = u8g2.ssd1306_i2c_128x64_noname(0, 0x3C)
-- disp:clearBuffer()
-- disp:setFont(u8g2.font_6x10_tf)
-- disp:drawStr(0, 15, "Ola, ESP8266!")
-- disp:sendBuffer()

print("I2C configurado: SDA GPIO4, SCL GPIO5")

