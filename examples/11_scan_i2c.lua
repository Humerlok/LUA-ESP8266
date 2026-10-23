-- Varredura de endereços I2C
-- SDA = D2/GPIO4, SCL = D1/GPIO5
i2c.setup(0, 4, 5, i2c.SLOW)

for endereco = 0x03, 0x77 do
  i2c.start(0)
  i2c.address(0, endereco, i2c.TRANSMITTER)
  local respondeu = i2c.stop(0)
  if respondeu then
    print(string.format("Dispositivo encontrado: 0x%02X", endereco))
  end
end

