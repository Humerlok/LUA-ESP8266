-- Exemplo NodeMCU/Lua: ESP8266 como ponto de acesso Wi-Fi
-- Depois de conectar à rede "ESP8266-Exemplo", acesse http://192.168.4.1

wifi.setmode(wifi.SOFTAP)

wifi.ap.config({
  ssid = "ESP8266-Exemplo",
  pwd = "esp8266senha"
})

local servidor = net.createServer(net.TCP)

servidor:listen(80, function(conexao)
  conexao:on("receive", function(_, requisicao)
    local pagina = [[
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ESP8266</title>
  <style>
    body { font-family: Arial; text-align: center; margin: 40px; }
    h1 { color: #1976d2; }
    .caixa { padding: 20px; border: 1px solid #ddd; border-radius: 10px; }
  </style>
</head>
<body>
  <div class="caixa">
    <h1>ESP8266 funcionando!</h1>
    <p>Esta página foi servida diretamente pelo NodeMCU.</p>
  </div>
</body>
</html>
]]

    conexao:send("HTTP/1.1 200 OK\r\nContent-Type: text/html; charset=utf-8\r\nConnection: close\r\n\r\n" .. pagina)
  end)

  conexao:on("sent", function(c)
    c:close()
  end)
end)

print("Rede Wi-Fi: ESP8266-Exemplo")
print("Senha: esp8266senha")
print("Acesse: http://192.168.4.1")
