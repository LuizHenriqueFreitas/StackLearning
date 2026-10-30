local utils = {}

---
---Printa o header da simulação
---
function utils.printHeader()
    -- printa o header da simulação
    print([[
==========================================================================================
                            _
                 _         | |
                | | _______| |---------------------------------------------\
                :-)_______|==[]============================================>
                |_|        | |---------------------------------------------/
                           |_|

------------------------------------------------------------------------------------------

                                  SIMULADOR DE BATALHAS

==========================================================================================

                    Você empunha sua espada e se prepara para lutar.
                                    É hora da batalha!

]])

end

---
---Calcula uma barra de progresso ASCII baseada em um atributo.
---@param attribute number Número de 0 a 10.
---@return string
---
function utils.getProgressBar(attribute)
    local fullChar = "⬜️"
    local emptyChar = "⬛️"

    local result = ""
    for i=1, 10, 1 do
        result = result .. (i <= attribute and fullChar or emptyChar)
    end
    return result
end


---
---Faz um print das informações de uma criatura.
---@param creature table
---
function utils.printCreature(creature)
    -- calcula a porcentagem de vida atual em comparação ao maximo possível
    local healthRate = math.floor((creature.health / creature.maxHealth) * 10)

    print("| " .. creature.name)
    print("| ")
    print("| " .. creature.description)
    print("| Atributos")
    print("|    Vida:         " .. utils.getProgressBar(healthRate))
    print("|    Ataque:       " .. utils.getProgressBar(creature.attack))
    print("|    Defesa:       " .. utils.getProgressBar(creature.defense))
    print("|    Velocidade:   " .. utils.getProgressBar(creature.speed))
end

function utils.ask()
    io.write("> ")
    local answer = io.read("*n")
    return answer
end 

return utils