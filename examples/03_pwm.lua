-- PWM para LED no D1 (GPIO5)
local LED = 5
local frequencia = 1000
local duty = 512 -- faixa NodeMCU normalmente: 0 a 1023

pwm.setup(LED, frequencia, duty)
pwm.start(LED)

-- Exemplos para alterar depois:
-- pwm.setduty(LED, 0)    -- 0%
-- pwm.setduty(LED, 512)  -- 50%
-- pwm.setduty(LED, 1023) -- 100%

