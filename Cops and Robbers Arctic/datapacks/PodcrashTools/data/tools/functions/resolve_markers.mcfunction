execute as @e[type=minecraft:armor_stand,nbt={Tags:["podcrash_marker"]}] run data merge entity @s {Marker:1b,Invisible:1b,Invincible:1b,Gravity:0b}
tellraw @a[tag=admin] {"text":"[PDT -> Markers resolved to usable state]"}