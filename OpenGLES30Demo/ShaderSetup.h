//
//  ShaderSetup.h
//  game10
//
//  Created by cow on 6/11/15.
//  Copyright © 2015 cow. All rights reserved.
//
#import "World.h"
#import <Foundation/Foundation.h>
#import <OpenGLES/ES3/gl.h>
#import <OpenGLES/ES3/glext.h>
@import CoreGraphics;

@interface ShaderSetup : NSObject

@property (atomic) World* world;

- (instancetype)initWithVertexShader:(NSString*)vsh fragmentShader:(NSString*)fsh;
- (void)renderInRect:(CGRect)rect atTime:(NSTimeInterval)time;

@end	
