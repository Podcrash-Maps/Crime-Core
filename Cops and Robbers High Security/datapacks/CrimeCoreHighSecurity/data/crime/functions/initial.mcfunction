#
# Initialize for gameplay
#

# Prepare map
function crime:reset

# Reset player
execute as @a[tag=!ignore.global] run function crime:reset_player

# Adjust player teams
team empty wardens
team empty prisoners
team empty escapees

execute if score crime_gametype value matches 1 run function crime:gamemode_classic
execute if score crime_gametype value matches 2 run function crime:gamemode_topsyturvy
execute if score crime_gametype value matches 3 run function crime:gamemode_buildup
execute if score crime_gametype value matches 4 run function crime:gamemode_ice

execute at @e[limit=1,type=armor_stand,tag=crime_marker_setting_villagAHHHHH] if block ~ ~1 ~ minecraft:lever[powered=true] at @e[type=minecraft:armor_stand] run summon minecraft:villager

# Loadouts
execute as @a[tag=!ignore.global,team=wardens] run function crime:loadout_warden
execute as @a[tag=!ignore.global,team=prisoners] run function crime:loadout_prisoner

# Messages
tellraw @a[team=wardens] [{"text":"Welcome to Cops and Robbers: High Security","color":"gold"},{"text":" By Podcrash","color":"aqua","clickEvent":{"action":"open_url","value":"https://podcrash.co"}},{"text":"\n\n"},{"text":"Cops and Robbers is a game of capture and escape. You are the cop, your goal is to roleplay normal prison life with the robbers, but, beware the Robbers will try to escape from your prison!\n\nIf all the prisoners escape the game is over and you lose.\n\nGood Luck!","color":"gray"}]
tellraw @a[team=prisoners] [{"text":"Welcome to Cops and Robbers: High Security","color":"gold"},{"text":" By Podcrash","color":"aqua","clickEvent":{"action":"open_url","value":"https://podcrash.co"}},{"text":"\n\n"},{"text":"Cops and Robbers is a game of capture and escape. You are a robber, and with your fellow robbers you must follow the Cops rules and follow daily prison life, and when the time's right find the nearest escape and run for your freedom!\n\nIf all the prisoners escape the game is over and you win!\n\nGood Luck!","color":"gray"}]

# Adjust Game State & other scoreboards
scoreboard players set crime_gamestate value 1
scoreboard players set crime_teleportal value 1
scoreboard players set crime_gatelocked value 1

# Adjust access
tag @a[tag=!ignore.global] remove access
tag @a[tag=!ignore.global,team=wardens] add access
