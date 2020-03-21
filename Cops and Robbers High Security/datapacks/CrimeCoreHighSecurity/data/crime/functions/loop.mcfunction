# Maintain players in adventure mode
gamemode adventure @a[tag=!admin,tag=!ignore.global]

# Lobby teleportation handler
execute as @a[tag=!ignore.global,team=] run function crime:lobbyme

# Alarm in Warden office
execute at @e[tag=crime_marker_alarm,tag=!triggered] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] if score crime_alarm value matches 1 run title @a[tag=!ignore.global] actionbar {"text":"Warden's Room Opened!","color":"red"}
execute as @e[tag=crime_marker_alarm] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run tag @s add triggered
execute as @e[tag=crime_marker_alarm] at @s if block ~ ~ ~ minecraft:stone_pressure_plate[powered=false] run tag @s remove triggered

# Players in non prisoners/wardens team
effect give @a[tag=!ignore.global,team=!prisoners,team=!wardens] minecraft:instant_health 2 10 true
effect give @a[tag=!ignore.global,team=!prisoners,team=!wardens] minecraft:saturation 2 10 true

# Escaping players
execute if score crime_gamestate value matches 1.. at @e[type=minecraft:armor_stand,tag=crime_marker_escape] as @a[tag=!ignore.global,team=prisoners,distance=..2.5] run function crime:escapeme
execute if score crime_gamestate value matches 1.. unless entity @a[tag=!ignore.global,team=prisoners] run function crime:end

# Settings
execute at @e[limit=1,type=armor_stand,tag=crime_marker_setting_cardio] if block ~ ~1 ~ minecraft:lever[powered=true] run effect give @a[tag=!ignore.global,team=prisoners] minecraft:speed 2 1 true

# Garbage Chute
execute unless score crime_emergarb value matches 1 at @e[type=minecraft:armor_stand,tag=crime_marker_garbagechute] if data block ~ ~ ~ Items[0] run function crime:garbage

# Warden
execute if score crime_gamestate value matches 1 run kill @e[type=minecraft:arrow,nbt={inGround:1b}]
execute if score crime_gamestate value matches 1 run effect give @a[tag=!ignore.global,team=wardens] minecraft:speed 2 1 true

# Determine player count
execute store result score crime_playercount value run list

# Dead player handler
execute as @a[tag=!ignore.global,team=prisoners,scores={death=1..}] run function crime:reset_player
execute as @a[tag=!ignore.global,team=prisoners,scores={death=1..}] if score crime_gametype value matches 3 run function crime:wardenme
scoreboard players set @a death 0

# Game trigger handler
execute at @e[tag=crime_marker_lobby_trigger,tag=!triggered] if score crime_gamestate value matches 0 if block ~ ~ ~ minecraft:light_weighted_pressure_plate[power=1] if score crime_playercount value matches 2.. run function crime:initial
execute at @e[tag=crime_marker_lobby_trigger,tag=!triggered] if score crime_gamestate value matches 0 if block ~ ~ ~ minecraft:light_weighted_pressure_plate[power=1] if score crime_playercount value matches ..1 run title @a actionbar {"text":"You need atleast 2 players to start the game!","color":"red"}
execute at @e[tag=crime_marker_lobby_trigger,tag=!triggered] if score crime_gamestate value matches 1 if block ~ ~ ~ minecraft:light_weighted_pressure_plate[power=1] run title @a[team=lobby] actionbar {"text":"Game in progress, please wait for the next round!","color":"red"}
execute as @e[tag=crime_marker_lobby_trigger] at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate[power=1] run tag @s add triggered
execute as @e[tag=crime_marker_lobby_trigger] at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate[power=0] run tag @s remove triggered

# Access loop
execute at @e[tag=crime_marker_access] if block ~ ~1 ~ minecraft:stone_button[powered=true] as @a[tag=!ignore.global,distance=..1] run title @s[tag=!access] actionbar {"text":"Full teleportal access granted!","color":"gray"}
execute at @e[tag=crime_marker_access] if block ~ ~1 ~ minecraft:stone_button[powered=true] as @a[tag=!ignore.global,distance=..1] run tag @s add access

# EXAMPLE execute at @e[tag=crime_marker_stair] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] as @a[tag=!ignore.global,tag=access,distance=..1] run teleport @s @e[tag=crime_marker_stair_loc,limit=1] 

# Open Teleports
execute at @e[tag=crime_marker_effects] as @a[tag=!ignore.global,distance=..1] run teleport @s @e[tag=crime_marker_effects_loc,limit=1] 
execute at @e[tag=crime_marker_lobby_tp] as @a[tag=!ignore.global,distance=..1] run teleport @s @e[tag=crime_marker_lobby,limit=1] 
execute at @e[tag=crime_marker_cells] as @a[tag=!ignore.global,distance=..1] run teleport @s @e[tag=crime_marker_cells_loc,limit=1] 
execute at @e[tag=crime_marker_surface] as @a[tag=!ignore.global,distance=..1] run teleport @s @e[tag=crime_marker_surface_loc,limit=1] 

# Teleportal
execute at @e[tag=crime_marker_teleportal_glass] if block ~ ~ ~ minecraft:red_stained_glass at @e[tag=crime_marker_teleportal] as @a[tag=!ignore.global,team=!wardens,distance=..2] run teleport @s @e[limit=1,tag=crime_marker_teleportal_solitary] 
execute at @e[tag=crime_marker_teleportal_glass] if block ~ ~ ~ minecraft:cyan_stained_glass at @e[tag=crime_marker_teleportal] as @a[tag=!ignore.global,tag=access,distance=..2] run teleport @s @e[limit=1,tag=crime_marker_teleportal_roof] 
execute at @e[tag=crime_marker_teleportal_glass] if block ~ ~ ~ minecraft:cyan_stained_glass at @e[tag=crime_marker_teleportal] as @a[tag=!ignore.global,tag=!access,distance=..2] run title @s actionbar {"text":"Teleportal access denied","color":"gray"} 

execute at @e[tag=crime_marker_teleportal_glass] if block ~ ~ ~ minecraft:red_stained_glass at @e[tag=crime_marker_teleportal_relink] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run function crime:relink

# Freezer
effect give @a[tag=!ignore.global,x=1038,y=60,z=-149,dx=11,dy=5,dz=13] minecraft:wither 2 1 true
effect give @a[tag=!ignore.global,x=1038,y=60,z=-149,dx=11,dy=5,dz=13] minecraft:slowness 2 1 true

# Cell Doors
execute at @e[type=minecraft:armor_stand,tag=crime_marker_celldoor_north] run function crime:door_north
execute at @e[type=minecraft:armor_stand,tag=crime_marker_celldoor_east] run function crime:door_east
execute at @e[type=minecraft:armor_stand,tag=crime_marker_celldoor_south] run function crime:door_south

# Gate
function crime:gate

# Game Type
execute at @e[tag=crime_marker_typebutton_1] if block ~ ~1 ~ minecraft:stone_button[powered=true] unless score crime_gametype value matches 1 run title @a[tag=!ignore.global] actionbar {"text":"Classic Mode Selected","color":"gold"}
execute at @e[tag=crime_marker_typebutton_1] if block ~ ~1 ~ minecraft:stone_button[powered=true] run scoreboard players set crime_gametype value 1

execute at @e[tag=crime_marker_typebutton_2] if block ~ ~1 ~ minecraft:stone_button[powered=true] unless score crime_gametype value matches 2 run title @a[tag=!ignore.global] actionbar {"text":"Topsy Turvy Mode Selected","color":"gold"}
execute at @e[tag=crime_marker_typebutton_2] if block ~ ~1 ~ minecraft:stone_button[powered=true] run scoreboard players set crime_gametype value 2

execute at @e[tag=crime_marker_typebutton_3] if block ~ ~1 ~ minecraft:stone_button[powered=true] unless score crime_gametype value matches 3 run title @a[tag=!ignore.global] actionbar {"text":"Build Up Mode Selected","color":"gold"}
execute at @e[tag=crime_marker_typebutton_3] if block ~ ~1 ~ minecraft:stone_button[powered=true] run scoreboard players set crime_gametype value 3

execute at @e[tag=crime_marker_typebutton_4] if block ~ ~1 ~ minecraft:stone_button[powered=true] unless score crime_gametype value matches 4 run title @a[tag=!ignore.global] actionbar {"text":"Klub IcE Mode Selected","color":"aqua"}
execute at @e[tag=crime_marker_typebutton_4] if block ~ ~1 ~ minecraft:stone_button[powered=true] run scoreboard players set crime_gametype value 4
