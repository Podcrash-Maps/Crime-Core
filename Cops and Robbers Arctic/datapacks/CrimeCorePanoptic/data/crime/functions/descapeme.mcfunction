team join prisoners @s
execute at @e[limit=1,type=armor_stand,tag=crime_marker_spawn_prisoners] run spawnpoint @s ~ ~ ~
title @a[tag=!ignore.global] actionbar [{"selector":"@s","color":"gold"},{"text":" has been redetained!","color":"gold"}]
