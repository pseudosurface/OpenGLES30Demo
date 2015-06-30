//
//  World.m
//  game10
//
//  Created by cow on 6/11/15.
//  Copyright © 2015 cow. All rights reserved.
//

#import "World.h"


@implementation World

-(id)init
{
    self = [super init];
    
    self.positions = malloc(sizeof(GLfloat)*MAX_SPHERES*3);
    self.velocities = malloc(sizeof(GLfloat)*MAX_SPHERES*3);
    
    for(int i = 0; i < MAX_SPHERES; i++)
    {
         self.positions[i*3+0] = sinf(i/(float)MAX_SPHERES*3.14*2.0)*.35;
         self.positions[i*3+1] = cosf(i/(float)MAX_SPHERES*3.14*2.0)*.35;
         self.positions[i*3+2] = 0.0;
        
        self.velocities[i*3+0] = sinf(i/(float)MAX_SPHERES*3.14*2.0)*.125;
        self.velocities[i*3+1] = cosf(i/(float)MAX_SPHERES*3.14*2.0)*.125;
        self.velocities[i*3+0] += sinf(i/(float)MAX_SPHERES*3.14*2.0+3.14/2.0)*.125;
        self.velocities[i*3+1] += cosf(i/(float)MAX_SPHERES*3.14*2.0+3.14/2.0)*.125;
        
        self.velocities[i*3+2] = 0.0;
    }
    self.lastTime = 0;
    return self;
}

-(id)update:(float)gameTime
{
    float timeStep = gameTime-self.lastTime;
    self.lastTime = gameTime;
    
    
    for(int i = 0; i < MAX_SPHERES; i++)
    {
        /*
        self.positions[i*3+0] = sinf(gameTime+i/(float)MAX_SPHERES*3.14*2.0)*.25;
        self.positions[i*3+1] = cosf(gameTime+i/(float)MAX_SPHERES*3.14*2.0)*.25;
        self.positions[i*3+2] = 0.0;
        */
        
        self.positions[i*3+0] += self.velocities[i*3+0]*timeStep;
        self.positions[i*3+1] += self.velocities[i*3+1]*timeStep;
        self.positions[i*3+2] += self.velocities[i*3+2]*timeStep;
        
        if(self.positions[i*3+0] < -1.0)
        {
            if(self.velocities[i*3+0] < 0)
                self.velocities[i*3+0] *= -1.0;
        }
        if(self.positions[i*3+0] > 1.0)
        {
            if(self.velocities[i*3+0] > 0)
                self.velocities[i*3+0] *= -1.0;
        }
        
        if(self.positions[i*3+1] < -1.0)
        {
            if(self.velocities[i*3+1] < 0)
                self.velocities[i*3+1] *= -1.0;
        }
        if(self.positions[i*3+1] > 1.0)
        {
            if(self.velocities[i*3+1] > 0)
                self.velocities[i*3+1] *= -1.0;
        }
        
        for(int j = 0; j < MAX_SPHERES; j++)
        {
            if(j != i)
            {
                float dx = self.positions[i*3+0]-self.positions[j*3+0];
                float dy = self.positions[i*3+1]-self.positions[j*3+1];
                float dist = sqrtf(dx*dx + dy*dy);
                
                if(dist > .05)
                {
                    float G = .000001;
                
                    float m1 = 10.0;
                    float m2 = 1000.0;
                
                    float force = G*m1*m2/(log(dist/5.0+1.0));
                
                    self.velocities[i*3+0] += -force*dx/dist*timeStep/m1;
                    self.velocities[i*3+1] += -force*dy/dist*timeStep/m1;
                }
            }
        }
        
        
    }
    
    
    
    return self;
}


@end
	