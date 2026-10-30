-- tem que adicionar mais variações de ataque aqui, esse codigo pasicamente está copiado do player actions

local colossusActions = {}

colossusActions.list = {}

-- cria uma lista de ações que é armazenada durante execução
function colossusActions.build()

    -- Reset list
    colossusActions.list {}

    -- Atacar com Espada
    local swordAttack = {
        description = "Atacar com espada.",
        requirement = nil,
        execute = function(playerData, creatureData)
            -- Define a chance de sucesso no ataque
            local sucessChance = creatureData.speed == 0 and 1 or creatureData.speed / playerData.speed
            local sucess = math.random() <= sucessChance

            -- Calcula o dano
            local rawDamage = creatureData.attack - math.random() * playerData.defense
            local damage = math.max(1, math.ceil(rawDamage))

            -- Apresenta o resultado para o usuário
            if sucess then
                print(string.format("Você atacou a criatura e deu %d pontos de dano", damage))
                
                -- aplica o dano em caso de sucesso
                playerData.health = playerData - damage

                local healthRate = math.floor((creatureData.health / creatureData.maxHealth) * 10)
                print(string.format("%s:, %s", creatureData.name, utils.getProgressBar))
            else
                print("Você errou o ataque!!!! Como pode ser tão ruim? KKKKKKKKKKK")
            end
        end
    }

    -- regenerar vida com poção
    local regenPotion = {
        description = "Tomar uma poção de cura"
        requirement = function(playerData)
            return playerData.potions >= 1
        end,
        execute = function(playerData)
            -- tira poção do inventário
            playerData.potions = playerData.potions - 1

            -- recupera vida
            local regenPoints = 5
            playerData.health = math.min(playerData.maxHealth, playerData.health + regenPoints)
            print("Você usou uma poção e recuperou alguns pontos de vida.")
        end
    }

    -- Populate list
    playerActions.list[#playerActions.list + 1] = swordAttack
end


---Retorna lista de ações válidas
---@param playerData table Definição do jogador
---@return table
function colossusActions.getValidActions(playerData, creatureData)
    local validActions = {}
    for _, action in pairs(playerActions.list) do
        local requirement = playerActions.requirement
        local isValid = requirement == nil or requirement(playerData)
        if isValid then
            validActions[#validActions+1] = action
        end
    end

    -- Populate list
    colossusActions.list[#colossusActions.list + 1] = swordAttack

    return validActions
end

return colossusActions