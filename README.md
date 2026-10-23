# ESP8266 NodeMCU — Upload de scripts Lua

Este guia explica como instalar o `nodemcu-tool`, descobrir a porta serial correta e enviar scripts Lua para um ESP8266 com firmware NodeMCU.

> O `nodemcu-tool` é uma ferramenta antiga. Recomenda-se usar **Node.js 20 LTS**. O Node.js 24 pode gerar erros no módulo de comunicação serial.

## 1. Descobrir a porta serial

Conecte o ESP8266 ao computador antes de executar os comandos.

### Windows

No PowerShell, liste as portas disponíveis:

```powershell
[System.IO.Ports.SerialPort]::GetPortNames()
```

Exemplo de resultado:

```text
COM9
```

Para confirmar qual dispositivo corresponde à porta, use:

```powershell
Get-PnpDevice -Class Ports | Format-Table -AutoSize
```

Desconecte o ESP8266, execute o comando, conecte-o novamente e execute o comando outra vez. A porta que apareceu é a correta.

Se nenhuma porta aparecer, pode ser necessário instalar o driver USB-serial CH340 ou CP210x, dependendo da placa.

### Debian / Ubuntu / Fedora

Liste as portas USB seriais:

```bash
ls /dev/ttyUSB* /dev/ttyACM* 2>/dev/null
```

O resultado normalmente será `/dev/ttyUSB0` ou `/dev/ttyACM0`.

Para identificar exatamente a porta, execute este comando, conecte o ESP8266 e execute-o novamente:

```bash
sudo dmesg --follow
```

Procure uma mensagem contendo `ttyUSB0` ou `ttyACM0`. Pressione `Ctrl+C` para sair.

Outra opção:

```bash
lsusb
```

Para verificar se o usuário tem permissão de acesso à porta:

```bash
groups
```

Se `dialout` não aparecer, execute:

```bash
sudo usermod -aG dialout $USER
```

Depois, encerre a sessão e entre novamente.

## 2. Instalar no Windows

Instale o Node.js 20 LTS. Com o `nvm-windows`, os comandos são:

```powershell
nvm install 20
nvm use 20
node --version
```

O resultado deve começar com `v20`.

Instale o programa de upload:

```powershell
npm install -g nodemcu-tool
nodemcu-tool --help
```

## 3. Instalar no Debian / Ubuntu

```bash
sudo apt update
sudo apt install -y curl build-essential
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

Feche e abra o terminal novamente:

```bash
nvm install 20
nvm use 20
node --version
npm install -g nodemcu-tool
```

## 4. Instalar no Fedora

```bash
sudo dnf install -y curl gcc-c++ make
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

Feche e abra o terminal novamente:

```bash
nvm install 20
nvm use 20
node --version
npm install -g nodemcu-tool
```

## 5. Enviar um script

Entre na pasta do projeto:

### Windows

```powershell
cd C:\Users\Renan\Documents\DEV\ESP8266
nodemcu-tool --port COM9 upload init.lua
```

### Linux

```bash
cd ~/ESP8266
nodemcu-tool --port /dev/ttyUSB0 upload init.lua
```

Para enviar um exemplo:

```powershell
nodemcu-tool --port COM9 upload examples/06_servidor_web_led.lua
```

No Linux, substitua `COM9` por `/dev/ttyUSB0`.

## 6. Comandos úteis

Listar arquivos gravados no ESP8266:

```text
nodemcu-tool --port COM9 file list
```

Abrir o terminal Lua:

```text
nodemcu-tool --port COM9 terminal
```

Executar um arquivo já enviado:

```lua
dofile("06_servidor_web_led.lua")
```

Reiniciar o ESP8266:

```lua
node.restart()
```

Remover um arquivo:

```text
nodemcu-tool --port COM9 remove init.lua
```

Feche Arduino IDE, monitores seriais, VS Code e outros programas que possam estar usando a porta antes do upload.

## 7. Exemplos deste projeto

```text
examples/01_led.lua
examples/02_led_controle.lua
examples/03_pwm.lua
examples/04_buzzer.lua
examples/05_oled_i2c.lua
examples/06_servidor_web_led.lua
examples/07_botao_led.lua
examples/08_rele.lua
examples/09_analogico.lua
examples/10_ds18b20.lua
examples/11_scan_i2c.lua
examples/12_wifi_estacao.lua
```

## 8. Problemas comuns

**Access is denied / Permission denied**

Feche qualquer monitor serial. No Linux, confirme que o usuário pertence ao grupo `dialout` e faça login novamente.

**Cannot find module ou erro de bindings serial**

Confirme que está usando Node.js 20 LTS e reinstale:

```bash
npm uninstall -g nodemcu-tool
npm install -g nodemcu-tool
```

**Nenhuma porta aparece**

Troque o cabo USB, conecte diretamente ao computador e instale o driver CH340 ou CP210x correspondente à placa.

**O script não executa**

Confirme que o firmware NodeMCU Lua está instalado e que o arquivo foi enviado para o ESP8266.

> O ESP8266 usa sinais de 3,3 V. Não aplique 5 V diretamente aos pinos GPIO.
