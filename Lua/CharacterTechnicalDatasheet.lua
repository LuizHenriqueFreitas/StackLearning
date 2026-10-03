--[[

That file is my very first lua script the objective here is just print a 
character data sheet.

======================================================
<Name>
<simple description>
<Type>

<Stats>
<Attack>
<Defense>
<Sp.Attack>
<Sp.Defense>
<Speed>
======================================================

]]

local name = "Charmander"
local description = "A little orange wizard - rare ones are green - with a flame on their tail"
local type = "Fire"

local attack = 3
local defense = 2
local sp_attack = 5
local sp_defense = 3
local speed = 5

local happines = 3
local health = 4

local function getProgressBar(atribute)
    local fullChar  = "⬜️"
    local emptyChar = "⬛️"

    local result = ""
    for i = 1, 5, 1 do
        if i <= atribute then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end
    end
    return result
end

print("==================================================================================")
print("| Name: " .. name)
print("| ", description)
print("| ")
print("| Type: " .. type)
print("| ")
print("| --------------------------------------------------------------------------------")
print("| ")
print("| Status:")
print("|  Attack_______" .. attack)
print("|  Defense______" .. defense)
print("|  Sp.Attack____" .. sp_attack)
print("|  Sp.Defense___" .. sp_defense)
print("|  Speed________" .. speed)
print("| ")
print("|  Happines_____" .. getProgressBar(happines))
print("|  Health_______" .. getProgressBar(health))
print("==================================================================================")