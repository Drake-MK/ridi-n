shader_type canvas_item;

uniform float dash_time : hint_range(0.0, 1.0);
uniform vec4 dash_color : source_color;

void fragment() {
    vec2 uv = FRAGCOORD.xy / TEXTURE_PIXEL_SIZE;
    vec4 color = texture(TEXTURE, uv);
    
    // Apply a motion blur effect when dashing
    if (dash_time > 0.0) {
        color = mix(color, dash_color, dash_time); // Blend in dash color
    }

    COLOR = color;
}