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

execute at @e[limit=1,type=armor_stand,tag=crime_marker_lobby_trigger] run team join wardens @p[tag=!ignore.global]
team join prisoners @a[tag=!ignore.global,team=!wardens] 

# Loadouts
execute as @a[tag=!ignore.global,team=wardens] run function crime:loadout_warden
execute as @a[tag=!ignore.global,team=prisoners] run function crime:loadout_prisoner

# Messages
tellraw @a[team=wardens] [{"text":"Welcome to Cops and Robbers: Alcatraz","color":"gold"},{"text":" By Podcrash","color":"aqua","clickEvent":{"action":"open_url","value":"https://podcrash.co"}},{"text":"\n\n"},{"text":"Cops and Robbers is a game of capture and escape. You are the cop, your goal is to roleplay normal prison life with the robbers, but, beware the Robbers will try to escape from your prison!\n\nIf all the prisoners escape the game is over and you lose.\n\nGood Luck!","color":"gray"}]
tellraw @a[team=prisoners] [{"text":"Welcome to Cops and Robbers: Alcatraz","color":"gold"},{"text":" By Podcrash","color":"aqua","clickEvent":{"action":"open_url","value":"https://podcrash.co"}},{"text":"\n\n"},{"text":"Cops and Robbers is a game of capture and escape. You are a robber, and with your fellow robbers you must follow the Cops rules and follow daily prison life, and when the time's right find the nearest escape and run for your freedom!\n\nIf all the prisoners escape the game is over and you win!\n\nGood Luck!","color":"gray"}]

# Set player spawn locations
execute at @e[limit=1,type=armor_stand,tag=crime_marker_spawn_prisoners] run spawnpoint @a[tag=!ignore.global,team=prisoners] ~ ~ ~
execute at @e[limit=1,type=armor_stand,tag=crime_marker_spawn_wardens] run spawnpoint @a[tag=!ignore.global,team=wardens] ~ ~ ~

# Teleportation
execute as @a[tag=!ignore.global,team=prisoners] run teleport @e[sort=random,tag=crime_marker_cell,limit=1]
execute as @a[tag=!ignore.global,team=wardens] run teleport @e[tag=crime_marker_spawn_wardens,limit=1]

# Adjust Game State
scoreboard players set crime_gamestate value 1

# Adjust access
tag @a[tag=!ignore.global] remove access
tag @a[tag=!ignore.global,team=wardens] add access

# Only for COPS 3 <----------
scoreboard players set crime_secret1 value 0
scoreboard players set crime_secret2 value 0
# Only for COPS 3 <----------