#pragma language glsl3

vec3 blur(Image tex, vec2 uv) {
    // Simple 3x3 blur kernel
    float offset = 1.0 / 300.0; // Adjust to control blur size
    vec3 result = vec3(0.0);
    result += Texel(tex, uv + vec2(-offset, -offset)).rgb * 0.0625;
    result += Texel(tex, uv + vec2( 0.0, -offset)).rgb * 0.125;
    result += Texel(tex, uv + vec2( offset, -offset)).rgb * 0.0625;
    result += Texel(tex, uv + vec2(-offset,  0.0)).rgb * 0.125;
    result += Texel(tex, uv + vec2( 0.0,  0.0)).rgb * 0.25;
    result += Texel(tex, uv + vec2( offset,  0.0)).rgb * 0.125;
    result += Texel(tex, uv + vec2(-offset,  offset)).rgb * 0.0625;
    result += Texel(tex, uv + vec2( 0.0,  offset)).rgb * 0.125;
    result += Texel(tex, uv + vec2( offset,  offset)).rgb * 0.0625;
    return result;
}

vec3 posterize(vec3 color, float levels) {
    return floor(color * levels) / levels;
}

vec4 effect(vec4 color, Image tex, vec2 texCoord, vec2 screenCoords)
{
    // Blur the texture
    vec3 col = blur(tex, texCoord);

    // Reduce color depth to simulate compression
    col = posterize(col, 5.0); // 5 levels per channel

    return vec4(col, 1.0) * color;
}
