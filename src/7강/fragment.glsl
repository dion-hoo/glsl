// 내장함수

precision mediump float;

uniform vec2 u_resolution;
uniform float u_time;

#define PI 3.1415926535897932384626433832795

float plot(vec2 st, float pct) {
    return smoothstep(pct - 0.02, pct, st.y) -
        smoothstep(pct, pct + 0.02, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy / u_resolution;

    float y = sin(st.x + u_time) * 0.5;

    vec3 color = vec3(y);

    float pct = plot(st, y);
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    gl_FragColor = vec4(color, 1.0);
}