//
//  SimplePanGestureRecognizer.m
//  SimplePanSample
//
//  Created by Emilien Stremsdoerfer on 06/06/2015.
//  Copyright (c) 2015 Emilien Stremsdoerfer. All rights reserved.
//

#import "SimplePanGestureRecognizer.h"

@interface SimplePanGestureRecognizer ()

@property(nonatomic) CGPoint panOrigin;

@end

@implementation SimplePanGestureRecognizer


- (instancetype)initWithTarget:(id)target dragAction:(SEL)dragAction releaseAction:(SEL)releaseAction {
    self = [super initWithTarget:self action:@selector(panView:)];
    self.target = target;
    self.dragAction = dragAction;
    self.releaseAction = releaseAction;
    self.releaseDuration = 0.3;
    return self;
}

- (void)panView:(UIPanGestureRecognizer*)gesture{
 
    CGPoint velocity = [gesture velocityInView:gesture.view];
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.panOrigin = gesture.view.frame.origin;
    }else if (gesture.state == UIGestureRecognizerStateChanged){
        CGPoint translation = [gesture translationInView:gesture.view];
        _viewOrigin = CGPointMake(self.panOrigin.x + translation.x, self.panOrigin.y+translation.y);
        [self.target performSelectorOnMainThread:self.dragAction withObject:self waitUntilDone:NO];
    }else if(gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled){
        _viewExpectedPoint = CGPointMake(self.releaseDuration*velocity.x+gesture.view.frame.origin.x,self.releaseDuration
                                         *velocity.y+gesture.view.frame.origin.y);
        [self.target performSelectorOnMainThread:self.releaseAction withObject:self waitUntilDone:NO];
    }
}

@end
