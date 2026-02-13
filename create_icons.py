#!/usr/bin/env python3
from PIL import Image, ImageDraw, ImageFont
import os

# Icon sizes for different densities
densities = {
    'mdpi': 48,
    'hdpi': 72,
    'xhdpi': 96,
    'xxhdpi': 144,
    'xxxhdpi': 192
}

base_dir = '/home/claude/AIStudentAssistant/app/src/main/res'
bg_color = (0, 108, 76)  # #006C4C
fg_color = (255, 255, 255)  # White

for density, size in densities.items():
    # Create directory if it doesn't exist
    icon_dir = os.path.join(base_dir, f'mipmap-{density}')
    os.makedirs(icon_dir, exist_ok=True)
    
    # Create image with transparency
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Draw circle background
    draw.ellipse([0, 0, size-1, size-1], fill=bg_color)
    
    # Draw "AI" text
    font_size = size // 3
    try:
        # Try to use a built-in font
        font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", font_size)
    except:
        # Fallback to default font
        font = ImageFont.load_default()
    
    text = "AI"
    # Get text bounding box
    bbox = draw.textbbox((0, 0), text, font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    
    # Center text
    x = (size - text_width) // 2
    y = (size - text_height) // 2 - font_size // 6
    
    draw.text((x, y), text, fill=fg_color, font=font)
    
    # Save both launcher and round launcher icons
    img.save(os.path.join(icon_dir, 'ic_launcher.png'))
    img.save(os.path.join(icon_dir, 'ic_launcher_round.png'))
    
    print(f"Created icons for {density}: {size}x{size}")

print("All launcher icons created successfully!")
