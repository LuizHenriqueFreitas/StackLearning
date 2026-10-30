--[[
    Este arquivo guarda o desenvolvimento de um simples simulador de batalha por turnos,
    apresetando um cabeçalho, apresentação e estatísticas do combate.
]]

--==================================================================================
-- ainda tem que adicionar a simulação de turnos do inimigo
-- e tambem os feedbacks de vitoria e derrota
--==================================================================================

local utils = require("utils")
local player = require("entities.player.player")
local playerActions = require("entities.player.playerActions")
local colossus = require("entities.colossus.colossus")

-- printa o header de acordo com o modulo utils
utils.printHeader()

-- instanciar colossus a uma outra variável aqui, permite uma rápida troca de criatura caso 
-- adicionemos mais opções de monstros, sendo assim basta trocar aqui e o resto do codigo continua funcionando
local creature = colossus

-- Apresenta monstro / Obtem a definição do monstro
utils.printCreature(creature)


-- loop de batalha
while true do

    print("O que você deseja fazer?")
    local validPlayerActions = playerActions.getValidActions(player)
    for i, playerActions in pairs(validPlayerActions) do
        print(string.format("%d. %s", i, playerActions.description))
    end

    local chosenIndex = utils.ask()
    local chosenAction = validPlayerActions[chosenIndex]
    local isActionValid = chosenAction ~= nil

    -- simula turno do jogador
    if isActionValid then
        chosenAction.execute(player, creature)
    else
        print("Ação invalida, perdeu a vez!")
    end
    
    -- ponto de saída - inimigo morreu
    if creature.health <= 0 then
        break
    end

    -- ponto de saída - jogador morreu
    if player.health <= 0 then
        break
    end
end