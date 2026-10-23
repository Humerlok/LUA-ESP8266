-- Servidor web: botão para ligar/desligar LED no D1 (GPIO5)
wifi.setmode(wifi.SOFTAP)
wifi.ap.config({ssid = "ESP8266-LED", pwd = "esp8266senha"})

local LED = 5
local estado = 0
gpio.mode(LED, gpio.OUTPUT)
gpio.write(LED, gpio.LOW)

local servidor = net.createServer(net.TCP)
servidor:listen(80, function(conexao)
  conexao:on("receive", function(_, requisicao)
    if string.find(requisicao, "GET /on") then
      estado = 1
      gpio.write(LED, gpio.HIGH)
    elseif string.find(requisicao, "GET /off") then
      estado = 0
      gpio.write(LED, gpio.LOW)
    end

    local texto = estado == 1 and "Ligado" or "Desligado"
    local pagina = "<html><head><meta charset='utf-8'><meta name='viewport' content='width=device-width'></head>" ..
      "<body style='font-family:Arial;text-align:center;margin-top:40px'>" ..
      "<h1>Controle do LED</h1><p>Estado: <b>" .. texto .. "</b></p>" ..
      "<p><a href='/on'><button style='font-size:24px'>Ligar</button></a></p>" ..
      "<p><a href='/off'><button style='font-size:24px'>Desligar</button></a></p></body></html>"

    conexao:send("HTTP/1.1 200 OK\r\nContent-Type: text/html; charset=utf-8\r\nConnection: close\r\n\r\n" .. pagina)
  end)
  conexao:on("sent", function(c) c:close() end)
end)

print("Conecte-se à rede ESP8266-LED")
print("Senha: esp8266senha")
print("Acesse http://192.168.4.1")

