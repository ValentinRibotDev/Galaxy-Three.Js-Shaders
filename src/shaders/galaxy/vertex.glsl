uniform float uSize;
uniform float uTime;

attribute float aScale;
attribute vec3 aRandomness;

varying vec3 vColor;

void main() {
    /**
    * Position
    */
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    //get the angle of the particle
    float angle = atan(modelPosition.x, modelPosition.z);

    //get the distance from the center of the particle
    float distanceToCenter = length(modelPosition.xz);

    //get the offset value
    float angleOffset = (1.0 / distanceToCenter) * uTime * 0.2;
    angle += angleOffset;

    modelPosition.x = cos(angle) * distanceToCenter;
    modelPosition.z = sin(angle) * distanceToCenter;

    // Randomness
    modelPosition.xyz += aRandomness;


    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPosition = projectionMatrix * viewPosition;

    gl_Position = projectionPosition;

    /**
    * Size
    */
    gl_PointSize = uSize * aScale;

    /**
    * Size Attenuation
    */
    gl_PointSize *= ( 1.0 / - viewPosition.z );

    vColor = color;
    
}