// https://thebookofshaders.com/03/
#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;
uniform vec2 u_mouse;
uniform vec2 u_resolution;

void main(){
    // slow
    //gl_FragColor = vec4(abs(sin(u_time / 20.)),0.0,0.0,1.0);
    
    // fast
    //gl_FragColor = vec4(abs(sin(u_time * 72.784)),0.0,0.0,1.0);
    
    //interesting
    gl_FragColor=vec4(abs(sin(u_time*.1784)),clamp(u_mouse.y/u_resolution.y,0.,1.),abs(sin(u_time*.3784+.9)),1.);
}