EXEMPLOS NODEMCU / ESP8266

Pinos usados:
  D1 = GPIO5
  D2 = GPIO4

Para enviar um exemplo:
  nodemcu-tool --port COM9 upload examples/01_led.lua

Para executar manualmente pelo console Lua:
  dofile("01_led.lua")

O exemplo do OLED precisa de um driver SSD1306 compatível com a versão do
firmware NodeMCU instalada. SDA vai no D2/GPIO4 e SCL no D1/GPIO5.

No servidor web, conecte-se à rede ESP8266-LED com a senha esp8266senha e
abra http://192.168.4.1.

Exemplos adicionais:
  07_botao_led.lua    botão com pull-up interno e debounce
  08_rele.lua         acionamento de módulo relé
  09_analogico.lua    leitura do A0
  10_ds18b20.lua      sensor de temperatura (requer driver)
  11_scan_i2c.lua     descoberta de dispositivos I2C
  12_wifi_estacao.lua conexão a um roteador existente

Altere SSID e SENHA em 12_wifi_estacao.lua antes de enviar. Não coloque
5 V diretamente nos GPIOs; o ESP8266 trabalha com sinais de 3,3 V.
