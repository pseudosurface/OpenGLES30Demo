//
//  ViewController.h
//  game10
//
//  Created by cow on 6/10/15.
//  Copyright © 2015 cow. All rights reserved.
//

#import <GLKit/GLKViewController.h>

@interface GLMultiTouchViewController : GLKViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

@end

