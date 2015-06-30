

#import "GLMultiTouchViewController.h"
#import "ShaderSetup.h"

@interface GLMultiTouchViewController ()

// Shader
@property (strong, nonatomic, readwrite) ShaderSetup* shader;

@end

@implementation GLMultiTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set up context
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    [EAGLContext setCurrentContext:context];
    
    // Set up view
    GLKView *glkView = (GLKView *)self.view;
    glkView.context = context;
    
    // OpenGL ES settings
    glClearColor(1.f, 0.f, 0.f, 1.f);
    
    // Initialize shader
    self.shader = [[ShaderSetup alloc] initWithVertexShader:@"Base" fragmentShader:@"Base"];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self.shader renderInRect:rect atTime:self.timeSinceFirstResume];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    int i = 0;
    for (UITouch *aTouch in touches) {
        CGPoint touchLocation = [aTouch locationInView:self.view];
        CGPoint lastTouchLocation = [aTouch previousLocationInView:self.view];
        NSLog(@"%f\t%f\n", touchLocation.x, touchLocation.y);
        
        float newX =touchLocation.x/(float)self.view.bounds.size.width*2.0-1.0;
        float newY = -(touchLocation.y/(float)self.view.bounds.size.height*2.0-1.0);
        
        float lastX =lastTouchLocation.x/(float)self.view.bounds.size.width*2.0-1.0;
        float lastY = -(lastTouchLocation.y/(float)self.view.bounds.size.height*2.0-1.0);
        
        self.shader.world.velocities[0+i*3] = (newX-lastX)*2.0;
        self.shader.world.velocities[1+i*3] = (newY-lastY)*2.0;
        
        self.shader.world.positions[0+i*3] = newX;
        self.shader.world.positions[1+i*3] = newY;
        i++;
    }
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

@end
