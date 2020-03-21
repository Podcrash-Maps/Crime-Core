
execute at @e[limit=1,type=minecraft:armor_stand,tag=crime_marker_gate_lock] if block ~ ~1 ~ minecraft:stone_button[powered=true] run scoreboard players set crime_gatelocked value 1
execute at @e[limit=1,type=minecraft:armor_stand,tag=crime_marker_gate_unlock] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] run scoreboard players set crime_gatelocked value 0

execute if score crime_gatelocked value matches 1 at @e[limit=1,type=minecraft:armor_stand,tag=crime_marker_gate_override_1] unless block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] at @e[limit=1,type=minecraft:armor_stand,tag=crime_marker_gate_override_2] unless block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] at @e[limit=1,type=minecraft:armor_stand,tag=crime_marker_gate] at @e[limit=1,type=minecraft:armor_stand,tag=crime_marker_gate] run setblock ~ ~1 ~-1 minecraft:iron_bars[east=true,west=true]
execute unless score crime_gatelocked value matches 1 at @e[limit=1,type=minecraft:armor_stand,tag=crime_marker_gate] run setblock ~ ~1 ~-1 minecraft:air

execute if score crime_gatelocked value matches 1 at @e[limit=1,type=minecraft:armor_stand,tag=crime_marker_gate_override_1] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] at @e[limit=1,type=minecraft:armor_stand,tag=crime_marker_gate_override_2] if block ~ ~ ~ minecraft:stone_pressure_plate[powered=true] at @e[limit=1,type=minecraft:armor_stand,tag=crime_marker_gate] run setblock ~ ~1 ~-1 minecraft:air

