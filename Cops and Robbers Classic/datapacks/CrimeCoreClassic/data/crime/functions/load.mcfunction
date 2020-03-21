#
# Establishes map environment into correct state for use by the data pack.
#

# Gamerules
gamerule spawnRadius 0
gamerule keepInventory true
gamerule mobGriefing false
gamerule commandBlockOutput false
gamerule sendCommandFeedback false
gamerule announceAdvancements false
gamerule doMobSpawning false
gamerule doDaylightCycle false
gamerule doWeatherCycle false
gamerule naturalRegeneration true
gamerule doImmediateRespawn true

# Scoreboards
scoreboard objectives add value dummy
scoreboard objectives add death deathCount
execute unless score crime_gamestate value matches 1 run scoreboard players set crime_gamestate value 0

# Teams
team add wardens
team modify wardens color aqua
team modify wardens nametagVisibility hideForOtherTeams
team add prisoners
team modify prisoners color gold
team modify prisoners nametagVisibility hideForOtherTeams
team add lobby
team modify lobby color gray
team add escapees
team modify escapees color green

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# podcrash_marker - identifier for all armour stands
# crime_marker_lobby - lobby spawn location
# crime_marker_spawn_wardens - spawn location of wardens
# crime_marker_spawn_prisoners - spawn location of prisoners
# crime_marker_escape - spawn/trigger location of escape
# crime_marker_lobby_trigger - location of game trigger
# crime_marker_cell - location of cells 
# crime_marker_reset_lever_(cardinal direction) - reset lever and accompanying door
# crime_marker_reset_trapdoor_(cardinal direction) - reset trapdoor often for vents
# crime_marker_reset_redstone_block - does what you would expect
# crime_marker_reset_hopper - does what you would expect
#
# crime_marker_access - raise clearance (ie give 'access' tag), located on stone pressure plate
# crime_marker_(staff tp) - teleports person with 'access' tag to certain location
# crime_marker_(staff tp)_loc - location identifier for previous marker
#
# crime_marker_alarm - alarm for pressure plate (generally warden's office)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #