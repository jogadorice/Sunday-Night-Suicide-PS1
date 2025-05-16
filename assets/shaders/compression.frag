#pragma language glsl3
extern float scaleFactor;

vec4 effect(vec4 color, Image tex, vec2 uv, vec2 screen_coords) {
    // Calculate sampling size
    vec2 texSize = vec2(love_ScreenSize.x, love_ScreenSize.y);
    vec2 scaledUV = floor(uv * texSize * scaleFactor) / (texSize * scaleFactor);

    // Average a small 3x3 sample region around the scaledUV
    vec2 offset = 1.0 / texSize / scaleFactor;
    vec4 sum = vec4(0.0);
    int count = 0;

    for (int x = -1; x <= 1; ++x) {
        for (int y = -1; y <= 1; ++y) {
            vec2 sampleUV = scaledUV + vec2(x, y) * offset;
            sum += Texel(tex, sampleUV);
            count++;
        }
    }

    return sum / float(count) * color;
}