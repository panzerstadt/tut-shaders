// https://thebookofshaders.com/05/
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 st, float pct) {
    return smoothstep(pct - 0.01, pct, st.y) -
    smoothstep(pct, pct + 0.01, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy / u_resolution * 2.0;
    
    float y = sin(st.x * 9.0 * 0.05 * u_time) + 1.0;
    float y2 = mod(y, 0.5) + 0.8;
    
    vec3 color = vec3(abs(sin(y2 + u_time * 2.0)), 0.6, abs(cos(y2 + u_time)));
    
    // Plot a line
    float pct = plot(st, y2);
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);
    
    gl_FragColor = vec4(color, 1.0);
}
