//
//  World.h
//  game10
//
//  Created by cow on 6/11/15.
//  Copyright © 2015 cow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGLES/ES3/gl.h>

#define MAX_SPHERES 16


@interface World : NSObject

@property (readwrite, atomic)GLfloat* positions;
@property (readwrite, atomic)GLfloat* velocities;
@property (readwrite, atomic)float lastTime;

-init;

-update:(float)gameTime;

@end
