#
# Initialize for gameplay
#

# Prepare map
function crime:reset
difficulty easy

# Reset player
execute as @a[tag=!ignore.global] run function crime:reset_player

# Adjust player teams
team empty wardens
team empty prisoners
team empty escapees

execute if score crime_gametype value matches 1 run function crime:gamemode_classic
execute if score crime_gametype value matches 2 run function crime:gamemode_topsyturvy
execute if score crime_gametype value matches 3 run function crime:gamemode_buildup

# Loadouts
execute as @a[tag=!ignore.global,team=wardens] run function crime:loadout_warden
execute as @a[tag=!ignore.global,team=prisoners] run function crime:loadout_prisoner

# Messages
tellraw @a[tag=!ignore.global,team=prisoners] [{"text":"Welcome to","color":"gold"},{"text":" Stoneward","color":"gray"},{"text":", you're an inmate of this prison. The objective is to escape without raising suspicion, you're still expected to participate in roll call, listen to instructions etc... most of the time. ","color":"gold"}]
tellraw @a[tag=!ignore.global,team=wardens] [{"text":"Welcome to","color":"gold"},{"text":" Stoneward","color":"gray"},{"text":", you're a ","color":"gold"},{"text":"warden","color":"aqua"},{"text":" of this prison. You have to keep the prisoners from escaping but still have to maintain their health and well being. This includes exercise, games, and meals.","color":"gold"}]

# Adjust Game State
scoreboard players set crime_gamestate value 1

# Secret Acacia Exit
scoreboard players set crime_buttonsecret1 value 0
scoreboard players set crime_buttonsecret2 value 0
scoreboard players set crime_buttonsecretactivated value 0