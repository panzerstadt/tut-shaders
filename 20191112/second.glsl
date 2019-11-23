// find out where your mouse is (?) https://thebookofshaders.com/03/
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 normMouse = u_mouse / u_resolution;

void main() {
    vec2 st = gl_FragCoord.xy / u_resolution;
    
    float nearX = st.x * 0.5 + normMouse.x * 0.5;
    float nearY = st.y * 0.5 + normMouse.y * 0.5;
    
    // vec4(r,g,b,a)
    
    gl_FragColor = vec4(nearX, nearY, abs(sin(0.6 * u_time / 5.0)) + 0.3, 1.0);
}
