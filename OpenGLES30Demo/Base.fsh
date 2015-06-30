precision highp float;

#define MAX_SPHERES 16

uniform vec3 spherePositions[MAX_SPHERES];
uniform vec2 uResolution;
uniform vec3 cam_pos;
uniform vec3 cam_dir;
uniform float uTime;

varying vec2 vPosition;

void main(void) {
    bool hit = false;
    int hits = 0;
    int i = 0;
    vec3 pos = vec3(vPosition, 0.0);
    float dist;
    float minDist = 10000.0;
    for(i = 0; i < MAX_SPHERES; i++)
    {
        dist = length(spherePositions[i]-pos);
        if(dist < .05)
        {
            hit = true;
            //minDist += cos(dist*2.0*3.14);///.5;
        }
        if(dist < minDist)
        {
            hits += 1;
            minDist = dist;
        }
    }
    
    
     if(hit)
        gl_FragColor = vec4(1.0);//vec4(vPosition.x, vPosition.y*uResolution.y/uResolution.x,0.0, 1.);
     else
         gl_FragColor = vec4(sin(minDist*minDist*50.0)*minDist*10.0, sin(minDist*minDist*50.0), 0.0, 1.0);
    
}

