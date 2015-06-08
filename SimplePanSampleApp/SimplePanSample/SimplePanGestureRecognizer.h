//
//  SimplePanGestureRecognizer.h
//  SimplePanSample
//
//  Created by Emilien Stremsdoerfer on 06/06/2015.
//  Copyright (c) 2015 Emilien Stremsdoerfer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimplePanGestureRecognizer : UIPanGestureRecognizer

@property(nonatomic) id target;
@property(nonatomic) SEL dragAction;
@property(nonatomic) SEL releaseAction;
@property(nonatomic,readonly) CGPoint viewOrigin;
@property(nonatomic,readonly) CGPoint viewExpectedPoint;


- (instancetype)initWithTarget:(id)target dragAction:(SEL)dragAction releaseAction:(SEL)releaseAction;

@end
