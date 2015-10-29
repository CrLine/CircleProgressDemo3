//
//  ViewController.m
//  CircleProgressDemo
//
//  Created by Jason Li on 15/10/28.
//  Copyright © 2015年 Jason Li. All rights reserved.
//

#import "ViewController.h"
#import "GraindView.h"

@interface ViewController ()
@property (nonatomic,strong) CAShapeLayer *shapeLayer;
@property (nonatomic,assign) CGFloat circleAdd;
@property (nonatomic,strong) GraindView *gradienView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initGradinView];
    [self creatView];

    [self startTimeClock];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)creatView
{
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = CGRectMake(0, 0, 320, 480);
    _shapeLayer.position = self.view.center;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;

    _shapeLayer.lineWidth = 0.5;
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;


    /*
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 200) radius:100 startAngle:-0.5*M_PI endAngle:1.5*M_PI clockwise:YES];
    self.shapeLayer.path = circlePath.CGPath;
     */
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(160, 200) radius:160 startAngle:-0.5*M_PI endAngle:0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:150 startAngle:0.5*M_PI endAngle:-0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:140 startAngle:-0.5*M_PI endAngle:0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:130 startAngle:0.5*M_PI endAngle:-0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:120 startAngle:-0.5*M_PI endAngle:0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:110 startAngle:0.5*M_PI endAngle:-0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:100 startAngle:-0.5*M_PI endAngle:0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:90 startAngle:0.5*M_PI endAngle:-0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:80 startAngle:-0.5*M_PI endAngle:0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:70 startAngle:0.5*M_PI endAngle:-0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:60 startAngle:-0.5*M_PI endAngle:0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:50 startAngle:0.5*M_PI endAngle:-0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:40 startAngle:-0.5*M_PI endAngle:0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:30 startAngle:0.5*M_PI endAngle:-0.5*M_PI clockwise:YES];
    [bezierPath addArcWithCenter:CGPointMake(160, 200) radius:20 startAngle:-0.5*M_PI endAngle:0.5*M_PI clockwise:YES];



    self.shapeLayer.path = bezierPath.CGPath;


    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0;
    _circleAdd = 0.05;
    [self.view.layer addSublayer:self.shapeLayer];
    self.view.backgroundColor = [UIColor grayColor];

}

- (void)startTimeClock
{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(circleAnimation) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(performAnimation) userInfo:nil repeats:YES];
}

- (void)circleAnimation
{
    static int i = 0;
    i++;
    int num = 1/_circleAdd;
    if (i < num) {
        self.shapeLayer.strokeEnd += _circleAdd;
    }else if (i < 2*num)
    {
        self.shapeLayer.strokeStart += _circleAdd;
    }else if (i < 3*num)
    {
        self.shapeLayer.strokeStart -= _circleAdd;
    }else if (i < 4*num)
    {
        self.shapeLayer.strokeEnd   -= _circleAdd;
    }else
    {
        i = 0;
    }


    [self randColor];

}

- (void)randColor
{
    self.shapeLayer.strokeColor = [UIColor colorWithRed:arc4random() % 255 / 255.0
                    green:arc4random() % 255 / 255.0
                     blue:arc4random() % 255 / 255.0
                                                   alpha:1.0].CGColor;
}

- (void)initGradinView
{
    _gradienView = [[GraindView alloc] initWithFrame:CGRectMake(0, 20, 200, 5)];
    [self.view addSubview:_gradienView];

    CAGradientLayer *layer = (CAGradientLayer *)[_gradienView layer];
    //CAGradientLayer *layer = [CAGradientLayer layer];
    //layer.frame = CGRectMake(0, 20, 200, 1);
    //[self.view.layer addSublayer:layer];
    [layer setStartPoint:CGPointMake(0.0, 0.5)];
    [layer setEndPoint:CGPointMake(1.0, 0.5)];

    // Create the gradient colors using hues in 5 degree increments

    NSMutableArray *colors = [NSMutableArray array];
    for (NSInteger deg = 0; deg <= 360; deg += 5) {

        UIColor *color;
        color = [UIColor colorWithHue:1.0 * deg / 360.0
                           saturation:1.0
                           brightness:1.0
                                alpha:1.0];
        [colors addObject:(id)[color CGColor]];
    }
    [layer setColors:[NSArray arrayWithArray:colors]];


    // Create another layer to use as a mask. The width of this layer will
    // be modified to reflect the current progress value.


}

- (NSArray *)shiftColors:(NSArray *)colors {

    // Moves the last item in the array to the front
    // shifting all the other elements.

    NSMutableArray *mutable = [colors mutableCopy];
    id last = [mutable lastObject];
    [mutable removeLastObject];
    [mutable insertObject:last atIndex:0];

    return [NSArray arrayWithArray:mutable];
}

- (void)performAnimation {

    // Update the colors on the model layer

    CAGradientLayer *layer = (id)(_gradienView.layer);
    NSArray *fromColors = [layer colors];
    NSArray *toColors = [self shiftColors:fromColors];
    [layer setColors:toColors];

    // Create an animation to slowly move the hue gradient left to right.

    CABasicAnimation *animation;
    animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    [animation setFromValue:fromColors];
    [animation setToValue:toColors];
    [animation setDuration:0.08];
    [animation setRemovedOnCompletion:YES];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animation setDelegate:self];

    // Add the animation to our layer

    [layer addAnimation:animation forKey:@"animateGradient"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
