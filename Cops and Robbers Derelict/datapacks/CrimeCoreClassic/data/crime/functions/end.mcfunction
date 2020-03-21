#
# End gameplay period
#

# Messages to be sent
title @a[tag=!ignore.global,team=escapees] actionbar {"text":"All prisoners escaped the prison!","color":"green"}
title @a[tag=!ignore.global,team=wardens] actionbar {"text":"All prisoners escaped the prison!","color":"red"}

# Send players back to spawn and reset
team leave @a[tag=!ignore.global]
execute as @a[tag=!ignore.global] run function crime:reset_player

# Adjust Game State
scoreboard players set crime_gamestate value 0