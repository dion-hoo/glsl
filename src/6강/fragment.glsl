precision mediump float;

uniform vec2 u_resolution;

float plot(vec2 st, float pct) {
    float span = 0.001;
    return smoothstep(pct - span, pct, st.y) - smoothstep(pct, pct + span, st.y);
}

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;

    float y = uv.x;

    vec3 color = vec3(y);

    float pct = plot(uv, y);
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    gl_FragColor = vec4(color, 1.0);
}