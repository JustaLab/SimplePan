//
//  ViewController.swift
//  SimplePanSample
//
//  Created by Emilien Stremsdoerfer on 05/06/2015.
//  Copyright (c) 2015 Emilien Stremsdoerfer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let square:UIView = UIView(frame: CGRectMake(0, 0, 200, 200))
    private var squareGesture:SimplePanGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button:UIButton = UIButton(frame: CGRectMake(0, 0, 100, 50))
        button.setTitle("reset", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.redColor()
        button.addTarget(self, action: "resetSquare", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        self.square.backgroundColor = UIColor.blackColor()
        
        self.squareGesture = SimplePanGestureRecognizer(target: self, dragAction: "dragSquare:", releaseAction: "releaseSquare:")
        self.square.addGestureRecognizer(self.squareGesture!)
        
        self.view.addSubview(self.square)
    }

    func dragSquare(gesture:SimplePanGestureRecognizer){
        var frame = self.square.frame
        frame.origin = gesture.viewOrigin
        self.square.frame = frame
    }
    
    func releaseSquare(gesture:SimplePanGestureRecognizer) {
        var frame = self.square.frame
        frame.origin = gesture.viewExpectedPoint
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.square.frame = frame
        })
    }
    
    func resetSquare(){
        self.square.frame = CGRectMake(0, 0, 200, 200)
    }
    
}

