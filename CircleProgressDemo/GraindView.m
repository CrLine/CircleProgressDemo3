//
//  GraindView.m
//  CircleProgressDemo
//
//  Created by Jason Li on 15/10/29.
//  Copyright © 2015年 Jason Li. All rights reserved.
//

#import "GraindView.h"

@implementation GraindView

+ (Class)layerClass {

    // Tells UIView to use CAGradientLayer as our backing layer

    return [CAGradientLayer class];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
