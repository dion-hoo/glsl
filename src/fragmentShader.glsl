precision mediump float;

uniform vec2 u_resolution;
uniform float u_time;

float u_radius = 100.0;
float u_damping = 0.94;
float u_stickiness = 120.0; // u_radius 보다 커야 자연스러운 효과

void main() {
    float top = u_resolution.y - u_radius;

    vec2 center = vec2(u_resolution.x * 0.5, top);

    float speed = 1.0;
    float amplitude = pow(u_damping, u_time * speed);
    float y = abs(cos(u_time * speed)) * top * amplitude;

    // 움직임을 원하면 아래 주석 해제
    center.y = y;

    vec2 uv = gl_FragCoord.xy;
    float dist = distance(uv, center);

    // smoothstep edge0 < edge1 순서로 수정
    float stickiness = smoothstep(u_radius, u_stickiness, dist);

    // stickiness 범위 밖이면 픽셀 버림
    if(dist > u_stickiness) {
        discard;
    }

    float alpha = 1.0 - stickiness;

    // 원 내부는 완전 불투명
    if(dist < u_radius) {
        alpha = 1.0;
    }

    gl_FragColor = vec4(1.0, 1.0, 1.0, alpha);
}
