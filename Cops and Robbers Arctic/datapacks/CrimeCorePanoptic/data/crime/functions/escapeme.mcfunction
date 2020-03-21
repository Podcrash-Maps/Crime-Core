team join escapees @s
execute at @e[limit=1,type=armor_stand,tag=crime_marker_escape] run spawnpoint @s ~ ~ ~
title @a[tag=!ignore.global] actionbar [{"selector":"@s","color":"green"},{"text":" has escaped from the prison!","color":"green"}]
