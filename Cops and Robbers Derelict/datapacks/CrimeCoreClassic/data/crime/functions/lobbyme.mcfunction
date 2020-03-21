execute at @e[limit=1,type=armor_stand,tag=crime_marker_lobby] run spawnpoint @s ~ ~ ~
execute at @e[limit=1,type=armor_stand,tag=crime_marker_lobby] run setworldspawn
teleport @s @e[limit=1,type=armor_stand,tag=crime_marker_lobby]

team join lobby @s

execute as @s run function crime:reset_player