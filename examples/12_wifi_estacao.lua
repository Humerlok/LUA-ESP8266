-- Conecta o ESP8266 a uma rede Wi-Fi existente
local SSID = "NOME_DA_SUA_REDE"
local SENHA = "SENHA_DA_SUA_REDE"

wifi.setmode(wifi.STATION)
wifi.sta.config({ssid = SSID, pwd = SENHA, save = false})
wifi.sta.connect()

tmr.create():alarm(1000, tmr.ALARM_AUTO, function(timer)
  local ip = wifi.sta.getip()
  if ip then
    print("Conectado. IP: " .. ip)
    timer:unregister()
  else
    print("Aguardando Wi-Fi...")
  end
end)

