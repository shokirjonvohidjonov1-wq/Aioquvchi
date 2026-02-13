#!/bin/bash
# Create placeholder launcher icons using ImageMagick

DENSITIES=("mdpi:48" "hdpi:72" "xhdpi:96" "xxhdpi:144" "xxxhdpi:192")
RES_DIR="app/src/main/res"

for density in "${DENSITIES[@]}"; do
    IFS=':' read -r name size <<< "$density"
    dir="${RES_DIR}/mipmap-${name}"
    
    # Create a simple green circle icon with "AI" text
    convert -size ${size}x${size} xc:none \
        -fill "#006C4C" -draw "circle $((size/2)),$((size/2)) $((size/2)),0" \
        -fill white -pointsize $((size/3)) -gravity center -annotate +0+0 "AI" \
        "${dir}/ic_launcher.png" 2>/dev/null || echo "ImageMagick not available, skipping icon creation"
    
    cp "${dir}/ic_launcher.png" "${dir}/ic_launcher_round.png" 2>/dev/null || true
done
