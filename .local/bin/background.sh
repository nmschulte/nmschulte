#!/usr/bin/env bash

# background randomizer and rotation script
# --
# pass a value to transition between backgrounds by fading to the background color
# - stores a copy of the backgound at ~/.background.jpg
# - keyword based: auto-tiling, random coloring
# - heuristic based auto-stretch for optimal presentation

colors=("#ff0000" "#7fff00" "#002f00" "#3f0000" "#9f009f" "#7f7f00" "#00007f" "#002faf" "#00af00" "#2f9fff")
bg_color="#181818"
cover_min_aspect=1.33
cover_max_aspect=2.00
fade_steps=8
img_dir_root=$HOME/Desktop/backgrounds/
background_cache=$HOME/.background.jpg

tileable_keyword=tileable
colorable_keyword=colorable
blacklist_keyword=blacklist

img=$(find $img_dir_root -type f ! -path "*/$blacklist_keyword/*" | sort -R | tail -1)
morph=full &&
    [[ $(identify -format "%w/%h > $cover_min_aspect && \
    %w/%h < $cover_max_aspect" "$img" | xargs echo | bc -l) == 0 ]] && morph=cover &&
    [[ "$img" == *$tileable_keyword* ]] && morph=tile
col_rnd=$(($RANDOM %2)) && col_rnd=1
color_flags="" &&
    [[ "$img" == *$colorable_keyword* ]] && color_flags="-tint ${colors[$RANDOM % ${#colors[@]}]}" &&
    [[ $col_rnd == 1 ]] && color_flags="-alpha $(($RANDOM % 16 * 10 + 48)) -add ${colors[$RANDOM % ${#colors[@]}]} \
    -add ${colors[$RANDOM % ${#colors[@]}]} -add ${colors[$RANDOM % ${#colors[@]}]} -gradient $(($RANDOM % 24 * 15))"

if [ ! -z "$1" ]; then
    for i in $(seq 1 $fade_steps); do
        hsetroot -center $background_cache -alpha $(($i * 32 - 1)) -solid "$bg_color"
        sleep 0.02s
    done
    for i in $(seq 1 $fade_steps); do
        hsetroot -solid $bg_color -$morph "$img" $color_flags -alpha $((256 - $i * 32)) -solid "$bg_color"
        sleep 0.02s
    done
fi

#echo hsetroot -solid $bg_color -$morph "$img" $color_flags -write $background_cache
hsetroot -solid $bg_color -$morph "$img" $color_flags -write $background_cache
