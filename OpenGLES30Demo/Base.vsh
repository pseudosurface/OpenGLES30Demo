precision highp float;

// Attributes
attribute vec2 aPosition;

varying vec2 vPosition;

void main(void) {
    vPosition = aPosition;
    gl_Position = vec4(aPosition, 0., 1.);
}
