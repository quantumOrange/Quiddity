//
//  Circle.swift
//  DrawingDemoApp
//
//  Created by David Crooks on 28/02/2017.
//  Copyright © 2017 David Crooks. All rights reserved.
//

import Foundation


public struct Circle  {
    
    public let center: Vec2
    public let radius: Double
    
    public init(center c:Vec2,radius r:Double){
        center = c
        radius = r
    }
    
    public init?(triangle:Triangle) {
        guard let circumcenter = triangle.circumcenter else { return nil }
        let v = circumcenter - triangle.a
        self.center = circumcenter
        self.radius = v.length
    }
    
    public init(line:Line) {
        self.center = line.start
        self.radius = line.vector.length
    }
    
}

extension Circle {
    
    public var perimeter:Double {
        return 2 * .pi * radius
    }
    
    public var area:Double {
        return .pi * radius * radius
    }
    
}


