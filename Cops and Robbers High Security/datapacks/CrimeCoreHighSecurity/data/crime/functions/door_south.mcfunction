# Door South
execute if block ~ ~1 ~ minecraft:lever[powered=true] run setblock ~ ~1 ~-1 minecraft:lime_wool
execute unless block ~ ~1 ~ minecraft:lever[powered=true] run setblock ~ ~1 ~-1 minecraft:red_wool

execute if block ~ ~1 ~ minecraft:lever[powered=true] run fill ~-2 ~ ~-1 ~-2 ~1 ~-1 minecraft:air
execute unless block ~ ~1 ~ minecraft:lever[powered=true] run fill ~-2 ~ ~-1 ~-2 ~1 ~-1 minecraft:iron_bars[west=true,east=true]