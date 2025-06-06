precision mediump float;

// uniform : cpu -> gpu로 정보를 넘겨주는 역할
uniform vec2 u_resolution; // 화면 해상도 가로,세로가 있기 때문에 vec2
uniform vec2 u_mouse; // 마우스 위치
uniform float u_time; // 시간

void main() {
    float red = abs(sin(u_time));
    gl_FragColor = vec4(red, 0.0, 0.0, 1.0);  
}