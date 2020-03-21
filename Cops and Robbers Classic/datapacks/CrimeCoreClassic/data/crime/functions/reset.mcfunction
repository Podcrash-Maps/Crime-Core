#
# Resets components of map such as doors to prison cells for example.
#


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
