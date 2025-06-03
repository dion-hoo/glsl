precision mediump float;

vec3 red() {
    return vec3(1.0, 0.0, 0.0);
}

vec3 green() {
    return vec3(0.0, 1.0, 0.0);
}

void main() {
    
    gl_FragColor = vec4(vec3(0.5), 1.0);
}

// float, int, bool
// vec2, vec3, vec4
// mat2, mat3, mat4
// sampler2D, samplerCube


