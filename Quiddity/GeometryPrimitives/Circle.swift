//
//  DCCircle.swift
//  DrawingDemoApp
//
//  Created by David Crooks on 28/02/2017.
//  Copyright © 2017 David Crooks. All rights reserved.
//

import Foundation
import CoreGraphics

//let twoPi = CGFloat.pi * 2
//let piByTwo = CGFloat.pi * 0.5

public struct Circle  {
    
    public let center: CGPoint
    public let radius: CGFloat
    
    public init(center c:CGPoint,radius r:CGFloat){
        center = c
        radius = r
    }
    
    public var perimeter:CGFloat {
        return 2 * .pi * radius
    }
    
    public var area:CGFloat {
        return .pi * radius * radius
    }
    
}
