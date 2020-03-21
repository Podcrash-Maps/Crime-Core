# Adjust player teams
execute at @e[limit=1,type=armor_stand,tag=crime_marker_lobby_trigger] run team join wardens @p[tag=!ignore.global]
team join prisoners @a[tag=!ignore.global,team=!wardens]

# Set player spawn locations
execute at @e[limit=1,type=armor_stand,tag=crime_marker_spawn_ice] run spawnpoint @a[tag=!ignore.global] ~ ~ ~

# Teleportation
execute as @a[tag=!ignore.global] run teleport @e[tag=crime_marker_spawn_ice,limit=1]


