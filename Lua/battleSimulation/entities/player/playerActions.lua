-- adicionar o nome do jogador nos prints

local playerActions = {}

playerActions.list = {}

-- cria uma lista de ações que é armazenada durante execução
function playerActions.build()

    -- Reset list
    playerActions.list {}

    -- Atacar com Espada
    local swordAttack = {
        description = "Atacar com espada.",
        requirement = nil,
        execute = function(playerData, creatureData)
            -- Define a chance de sucesso no ataque
            local sucessChance = creatureData.speed == 0 and 1 or playerData.speed / creatureData.speed
            local sucess = math.random() <= sucessChance

            -- Calcula o dano
            local rawDamage = playerData.attack - math.random() * creatureData.defense
            local damage = math.max(1, math.ceil(rawDamage))

            -- Apresenta o resultado para o usuário
            if sucess then
                print(string.format("%s atacou a criatura e deu %d pontos de dano", playerData.name, damage))
                
                -- aplica o dano em caso de sucesso
                creatureData.health = creatureData - damage

                local healthRate = math.floor((creatureData.health / creatureData.maxHealth) * 10)
                print(string.format("%s:, %s", creatureData.name, utils.getProgressBar))
            else
                print(string.format("%s errou o ataque!!!! Como pode ser tão ruim? KKKKKKKKKKK", playerData.name)) 
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
            print("%s usou uma poção e recuperou alguns pontos de vida.", playerData.name)
        end
    }

    -- Populate list
    playerActions.list[#playerActions.list + 1] = swordAttack
end


---Retorna lista de ações válidas
---@param playerData table Definição do jogador
---@return table
function playerActions.getValidActions(playerData, creatureData)
    local validActions = {}
    for _, action in pairs(playerActions.list) do
        local requirement = playerActions.requirement
        local isValid = requirement == nil or requirement(playerData)
        if isValid then
            validActions[#validActions+1] = action
        end
    end

    -- Populate list
    playerActions.list[#playerActions.list + 1] = usePotion

    return validActions
end

return playerActions