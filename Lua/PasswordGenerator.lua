--- simple password generator - just for learning lua sintax

--- IMPORTANT
--- that is a very UNSAFE password algorithm

local letters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
local numbers = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}
local specials = {"%", "$", "#", "@", "!", "<", ">", "="}
local characterLists = {
    letters,
    numbers,
    specials,
    characterLists
}

print("What should be the password lenght?")
local lenght = io.read("*n")

local password = ""
for i = 1, lenght, 1 do
    
    local listIndex = math.random(#characterLists)

    local index = math.random(#letters)
    local char = letters[index]

    password = password .. char
end

print("Your new password: ")
print(password)