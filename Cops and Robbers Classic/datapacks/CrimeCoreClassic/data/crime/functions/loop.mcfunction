# Maintain players in adventure mode
gamemode adventure @a[tag=!admin,tag=!ignore.global]

# Lobby teleportation handler
execute as @a[tag=!ignore.global,team=] run function crime:lobbyme

# Alarm
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_hopper] unless data block ~ ~ ~ Items[0] run scoreboard players set crime_alarm value 1
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_hopper] if data block ~ ~ ~ Items[0] run scoreboard players set crime_alarm value 0

execute at @e[tag=crime_marker_alarm,tag=!triggered] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] if score crime_alarm value matches 1 run title @a[tag=!ignore.global] actionbar {"text":"Warden's office alarm triggered!"}
execute as @e[tag=crime_marker_alarm] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run tag @s add triggered
execute as @e[tag=crime_marker_alarm] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=false] run tag @s remove triggered

# Players in non prisoners/wardens team
effect give @a[tag=!ignore.global,team=!prisoners,team=!wardens] minecraft:instant_health 2 10 true
effect give @a[tag=!ignore.global,team=!prisoners,team=!wardens] minecraft:saturation 2 10 true

# Escaping players
execute if score crime_gamestate value matches 1.. at @e[type=minecraft:armor_stand,tag=crime_marker_escape] as @a[tag=!ignore.global,team=prisoners,distance=..11] run function crime:escapeme
execute if score crime_gamestate value matches 1.. unless entity @a[tag=!ignore.global,team=prisoners] run function crime:end

# Warden
execute if score crime_gamestate value matches 1 run kill @e[type=minecraft:arrow,nbt={inGround:1b}]
execute if score crime_gamestate value matches 1 run effect give @a[tag=!ignore.global,team=wardens] minecraft:speed 2 1 true

# Determine player count
execute store result score crime_playercount value run list

# Dead player handler
execute as @a[tag=!ignore.global,team=prisoners,scores={death=1..}] run function crime:reset_player
scoreboard players set @a death 0

# Game trigger handler
execute at @e[tag=crime_marker_lobby_trigger,tag=!triggered] if score crime_gamestate value matches 0 if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] if score crime_playercount value matches 2.. run function crime:initial
execute at @e[tag=crime_marker_lobby_trigger,tag=!triggered] if score crime_gamestate value matches 0 if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] if score crime_playercount value matches ..1 run title @a actionbar {"text":"You need atleast 2 players to start the game!","color":"red"}
execute at @e[tag=crime_marker_lobby_trigger,tag=!triggered] if score crime_gamestate value matches 1 if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run title @a[team=lobby] actionbar {"text":"Game in progress, please wait for the next round!","color":"red"}
execute as @e[tag=crime_marker_lobby_trigger] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run tag @s add triggered
execute as @e[tag=crime_marker_lobby_trigger] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=false] run tag @s remove triggered

# Access loop
execute at @e[tag=crime_marker_access] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] as @a[tag=!ignore.global,distance=..1] run title @s[tag=!access] actionbar {"text":"Security clearance raised!"}
execute at @e[tag=crime_marker_access] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] as @a[tag=!ignore.global,distance=..1] run tag @s add access

execute at @e[tag=crime_marker_stair] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] as @a[tag=!ignore.global,tag=access,distance=..1] run teleport @s @e[tag=crime_marker_stair_loc,limit=1] 
execute at @e[tag=crime_marker_stair2] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] as @a[tag=!ignore.global,tag=access,distance=..1] run teleport @s @e[tag=crime_marker_stair2_loc,limit=1] 
execute at @e[tag=crime_marker_door] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] as @a[tag=!ignore.global,tag=access,distance=..1] run teleport @s @e[tag=crime_marker_door_loc,limit=1] 
