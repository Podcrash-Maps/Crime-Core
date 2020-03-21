execute at @e[limit=1,type=armor_stand,tag=crime_marker_lobby_trigger] run team join prisoners @p[tag=!ignore.global]
team join wardens @a[tag=!ignore.global,team=!prisoners]