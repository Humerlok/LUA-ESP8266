-- Leitura da entrada analógica A0
-- Verifique a tensão máxima aceita pela sua placa NodeMCU.
tmr.create():alarm(1000, tmr.ALARM_AUTO, function()
  local valor = adc.read(0)
  print("A0 = " .. valor)
end)

