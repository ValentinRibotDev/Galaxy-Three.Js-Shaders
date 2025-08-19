varying vec3 vColor;

void main() {
    //Point light particles
    float strength = pow((1.0 - distance(gl_PointCoord, vec2(0.5)) * 2.0), 10.0);

    // Color
    vec3 color = mix(vec3(0.0), vColor, strength);
    
    gl_FragColor = vec4(vec3(color), 1.0);
    #include <colorspace_fragment>
}