# Maintain players in adventure mode
gamemode adventure @a[tag=!admin,tag=!ignore.global]

# Lobby teleportation handler
execute as @a[tag=!ignore.global,team=] run function crime:lobbyme

# Standard Alarm
execute at @e[tag=crime_marker_alarm,tag=!triggered] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run title @a[tag=!ignore.global] actionbar {"text":"Door alarm triggered!"}
execute as @e[tag=crime_marker_alarm] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run tag @s add triggered
execute as @e[tag=crime_marker_alarm] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=false] run tag @s remove triggered

# Vent Alarm
execute at @e[tag=crime_marker_alarm_vent,tag=!triggered] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run title @a[tag=!ignore.global] actionbar {"text":"Vent alarm triggered!"}
execute as @e[tag=crime_marker_alarm_vent] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run tag @s add triggered
execute as @e[tag=crime_marker_alarm_vent] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=false] run tag @s remove triggered

# Players in non prisoners/wardens team
effect give @a[tag=!ignore.global,team=!prisoners,team=!wardens] minecraft:regeneration 2 3 true
effect give @a[tag=!ignore.global,team=!prisoners,team=!wardens] minecraft:saturation 2 10 true

# Escaping players
execute if score crime_gamestate value matches 1.. at @e[type=minecraft:armor_stand,tag=crime_marker_escape] as @a[tag=!ignore.global,team=prisoners,distance=..2.5] run function crime:escapeme
execute if score crime_gamestate value matches 1.. at @e[type=minecraft:armor_stand,tag=crime_marker_escape] as @a[tag=!ignore.global,team=wardens,distance=..4] run function crime:wardenspray
execute if score crime_gamestate value matches 1.. unless entity @a[tag=!ignore.global,team=prisoners] run function crime:end

# Warden
execute if score crime_gamestate value matches 1.. run kill @e[type=minecraft:arrow,nbt={inGround:1b}]
execute if score crime_gamestate value matches 1.. run effect give @a[tag=!ignore.global,team=wardens] minecraft:speed 2 1 true
execute if score crime_gamestate value matches 1.. run effect give @a[tag=!ignore.global,team=wardens] minecraft:saturation 2 10 true

execute if score crime_gamestate value matches 1.. at @e[type=minecraft:armor_stand,tag=crime_marker_access] unless entity @a[tag=!ignore.global,team=wardens,distance=..1.5] run setblock ~ ~-2 ~ minecraft:air
execute if score crime_gamestate value matches 1.. at @e[type=minecraft:armor_stand,tag=crime_marker_access] as @a[tag=!ignore.global,team=wardens,distance=..1.5] run setblock ~ ~-2 ~ minecraft:redstone_torch

# Determine player count
execute store result score crime_playercount value run list

# Dead player handler
execute as @a[tag=!ignore.global,team=escapees,scores={death=1..}] run function crime:descapeme
execute as @a[tag=!ignore.global,team=prisoners,scores={death=1..}] if score crime_gametype value matches 3 run function crime:wardenme

execute as @a[tag=!ignore.global,team=prisoners,scores={death=1..}] run scoreboard players set @s cellTpTimer 1000
execute as @a[tag=!ignore.global,team=prisoners,scores={cellTpTimer=1..}] run scoreboard players remove @s cellTpTimer 1
execute as @a[x=685,y=131,z=595,dx=12,dy=5,dz=-12,tag=!ignore.global,team=prisoners,scores={cellTpTimer=..0}] run function crime:teleport_respawned_player
execute as @a[tag=!ignore.global,team=prisoners,scores={death=1..}] run function crime:reset_player

scoreboard players set @a death 0

# Game trigger handler
execute at @e[tag=crime_marker_lobby_trigger,tag=!triggered] if score crime_gamestate value matches 0 if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] if score crime_playercount value matches 2.. run function crime:initial
execute at @e[tag=crime_marker_lobby_trigger,tag=!triggered] if score crime_gamestate value matches 0 if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] if score crime_playercount value matches ..1 run title @a actionbar {"text":"You need atleast 2 players to start the game!","color":"red"}
execute at @e[tag=crime_marker_lobby_trigger,tag=!triggered] if score crime_gamestate value matches 1 if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run title @a[team=lobby] actionbar {"text":"Game in progress, please wait for the next round!","color":"red"}
execute as @e[tag=crime_marker_lobby_trigger] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run tag @s add triggered
execute as @e[tag=crime_marker_lobby_trigger] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=false] run tag @s remove triggered

# Secret Acacia Exit
execute if block 771 122 649 minecraft:acacia_button[powered=true] run scoreboard players set crime_buttonsecret1 value 1
execute if block 737 135 610 minecraft:acacia_button[powered=true] run scoreboard players set crime_buttonsecret2 value 1
execute if score crime_buttonsecret1 value matches 1.. if score crime_buttonsecret2 value matches 1.. if score crime_buttonsecretactivated value matches 0 run function crime:button_secret

# Game Type
execute at @e[tag=crime_marker_typebutton_1] if block ~ ~1 ~ minecraft:stone_button[powered=false] unless score crime_gametype value matches 1 run setblock ~2 ~2 ~ minecraft:air
execute at @e[tag=crime_marker_typebutton_1] if block ~ ~1 ~ minecraft:stone_button[powered=true] unless score crime_gametype value matches 1 run title @a[tag=!ignore.global] actionbar {"text":"Classic Mode Selected","color":"gold"}
execute at @e[tag=crime_marker_typebutton_1] if block ~ ~1 ~ minecraft:stone_button[powered=true] run scoreboard players set crime_gametype value 1
execute at @e[tag=crime_marker_typebutton_1] if block ~ ~1 ~ minecraft:stone_button if score crime_gametype value matches 1 run setblock ~2 ~2 ~ minecraft:redstone_block

execute at @e[tag=crime_marker_typebutton_2] if block ~ ~1 ~ minecraft:stone_button[powered=false] unless score crime_gametype value matches 2 run setblock ~2 ~2 ~ minecraft:air
execute at @e[tag=crime_marker_typebutton_2] if block ~ ~1 ~ minecraft:stone_button[powered=true] unless score crime_gametype value matches 2 run title @a[tag=!ignore.global] actionbar {"text":"Topsy Turvy Mode Selected","color":"gold"}
execute at @e[tag=crime_marker_typebutton_2] if block ~ ~1 ~ minecraft:stone_button[powered=true] run scoreboard players set crime_gametype value 2
execute at @e[tag=crime_marker_typebutton_2] if block ~ ~1 ~ minecraft:stone_button if score crime_gametype value matches 2 run setblock ~2 ~2 ~ minecraft:redstone_block

execute at @e[tag=crime_marker_typebutton_3] if block ~ ~1 ~ minecraft:stone_button[powered=false] unless score crime_gametype value matches 3 run setblock ~2 ~2 ~ minecraft:air
execute at @e[tag=crime_marker_typebutton_3] if block ~ ~1 ~ minecraft:stone_button[powered=true] unless score crime_gametype value matches 3 run title @a[tag=!ignore.global] actionbar {"text":"Build Up Mode Selected","color":"gold"}
execute at @e[tag=crime_marker_typebutton_3] if block ~ ~1 ~ minecraft:stone_button[powered=true] run scoreboard players set crime_gametype value 3
execute at @e[tag=crime_marker_typebutton_3] if block ~ ~1 ~ minecraft:stone_button if score crime_gametype value matches 3 run setblock ~2 ~2 ~ minecraft:redstone_block