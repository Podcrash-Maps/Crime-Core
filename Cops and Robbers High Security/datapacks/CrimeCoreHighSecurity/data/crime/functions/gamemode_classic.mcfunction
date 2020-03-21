# Adjust player teams
execute at @e[limit=1,type=armor_stand,tag=crime_marker_lobby_trigger] run team join wardens @p[tag=!ignore.global]
team join prisoners @a[tag=!ignore.global,team=!wardens]

# Set player spawn locations
execute at @e[limit=1,type=armor_stand,tag=crime_marker_spawn_prisoners] run spawnpoint @a[tag=!ignore.global,team=prisoners] ~ ~ ~
execute at @e[limit=1,type=armor_stand,tag=crime_marker_spawn_wardens] run spawnpoint @a[tag=!ignore.global,team=wardens] ~ ~ ~

# Teleportation
execute as @a[tag=!ignore.global,team=prisoners] run teleport @e[sort=random,tag=crime_marker_cell,limit=1]
execute as @a[tag=!ignore.global,team=wardens] run teleport @e[tag=crime_marker_spawn_wardens,limit=1]
