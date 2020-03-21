# Prisoner item loadout (The default version of "Cops and Robbers" does not come with a loadout for prisoners)

execute at @e[limit=1,type=armor_stand,tag=crime_marker_setting_fatigue] if block ~ ~1 ~ minecraft:lever[powered=true] run replaceitem entity @s hotbar.1 minecraft:splash_potion{Potion:"minecraft:slowness"}
execute at @e[limit=1,type=armor_stand,tag=crime_marker_setting_fatigue] if block ~ ~1 ~ minecraft:lever[powered=true] run replaceitem entity @s hotbar.2 minecraft:splash_potion{Potion:"minecraft:slowness"}
execute at @e[limit=1,type=armor_stand,tag=crime_marker_setting_fatigue] if block ~ ~1 ~ minecraft:lever[powered=true] run replaceitem entity @s hotbar.3 minecraft:splash_potion{Potion:"minecraft:slowness"}

execute at @e[limit=1,type=armor_stand,tag=crime_marker_setting_rogue] if block ~ ~1 ~ minecraft:lever[powered=true] run replaceitem entity @s hotbar.5 minecraft:splash_potion{Potion:"minecraft:invisibility"}
execute at @e[limit=1,type=armor_stand,tag=crime_marker_setting_rogue] if block ~ ~1 ~ minecraft:lever[powered=true] run replaceitem entity @s hotbar.6 minecraft:splash_potion{Potion:"minecraft:invisibility"}
execute at @e[limit=1,type=armor_stand,tag=crime_marker_setting_rogue] if block ~ ~1 ~ minecraft:lever[powered=true] run replaceitem entity @s hotbar.7 minecraft:splash_potion{Potion:"minecraft:invisibility"}

