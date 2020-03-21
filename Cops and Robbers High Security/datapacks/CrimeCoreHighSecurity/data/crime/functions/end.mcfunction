#
# End gameplay period
#

# Messages to be sent
execute if score crime_gametype value matches 1 run title @a[tag=!ignore.global,team=escapees] actionbar {"text":"All prisoners escaped the island!","color":"green"}
execute if score crime_gametype value matches 1 run title @a[tag=!ignore.global,team=wardens] actionbar {"text":"All prisoners escaped the island!","color":"red"}

execute if score crime_gametype value matches 2 run title @a[tag=!ignore.global] actionbar {"text":"Against all odds, the one and only prisoner managed to escape!","color":"gold"}

execute if score crime_gametype value matches 3 run title @a[tag=!ignore.global,team=escapees] actionbar {"text":"All prisoners escaped the island or were conscripted!","color":"green"}
execute if score crime_gametype value matches 3 run title @a[tag=!ignore.global,team=wardens] actionbar {"text":"All prisoners escaped the island or were conscripted!","color":"red"}

execute if score crime_gametype value matches 4 run title @a[tag=!ignore.global] actionbar {"text":"Party's over, everyone left!","color":"aqua"}

execute if score crime_gametype value matches 5.. run title @a[tag=!ignore.global] actionbar {"text":"HACKER HACKER HACKER!!!","color":"gold"}


# Send players back to spawn and reset
team leave @a[tag=!ignore.global]
execute as @a[tag=!ignore.global] run function crime:reset_player

# Adjust Game State
scoreboard players set crime_gamestate value 0