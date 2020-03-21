#
# Resets components of map such as doors to prison cells for example.
#

# Scoreboards
scoreboard players reset crime_emergarb value

# Door reset
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_lever_south] run setblock ~ ~1 ~ minecraft:stone
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_lever_north] run setblock ~ ~1 ~ minecraft:stone
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_lever_east] run setblock ~ ~1 ~ minecraft:stone
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_lever_west] run setblock ~ ~1 ~ minecraft:stone

execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_lever_south] run setblock ~ ~1 ~ minecraft:lever[facing=south]
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_lever_north] run setblock ~ ~1 ~ minecraft:lever[facing=north]
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_lever_east] run setblock ~ ~1 ~ minecraft:lever[facing=east]
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_lever_west] run setblock ~ ~1 ~ minecraft:lever[facing=west]

# Trapdoor (vent) reset
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_trapdoor_south] run setblock ~ ~ ~ minecraft:oak_trapdoor[open=true,facing=south,half=top]
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_trapdoor_north] run setblock ~ ~ ~ minecraft:oak_trapdoor[open=true,facing=north,half=top]
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_trapdoor_east] run setblock ~ ~ ~ minecraft:oak_trapdoor[open=true,facing=east,half=top]
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_trapdoor_west] run setblock ~ ~ ~ minecraft:oak_trapdoor[open=true,facing=west,half=top]

# Place redstone_block
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_redstone_block] run setblock ~ ~ ~ redstone_block

# Hopper
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_hopper] run data remove block ~ ~ ~ Items

# Escapes and Teleportal
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_double_chiselbricks] run fill ~ ~ ~ ~ ~1 ~ minecraft:chiseled_stone_bricks

execute at @e[type=minecraft:armor_stand,tag=crime_marker_teleportal_glass] run fill ~ ~ ~ ~ ~1 ~ minecraft:red_stained_glass
execute at @e[type=minecraft:armor_stand,tag=crime_marker_teleportal_glass] run data merge block ~-1 ~ ~ {Text1:'{"text":"TELEPORTAL","bold":true}',Text2:'{"text":"-----"}',Text3:'{"text":"Destination:"}',Text4:'{"text":"Solitary"}'}

# Chests
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_chest_basketballs] run data merge block ~ ~ ~ {Items:[],LootTable:"crime:basketballs"}
execute at @e[type=minecraft:armor_stand,tag=crime_marker_reset_chest_freezer] run data merge block ~ ~ ~ {Items:[],LootTable:"crime:freezer"}