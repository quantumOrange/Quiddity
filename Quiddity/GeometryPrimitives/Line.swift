//
//  Line.swift
//  Quiddity
//
//  Created by David Crooks on 17/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

public struct Line {
    
    public let start:Vec2
    public let end:Vec2
    
    public init(start:Vec2, end:Vec2) {
        self.start = start
        self.end = end
    }
    
    public var vector:Vec2 {
        return end - start
    }
    
    public var midPoint:Vec2 {
        return  start + 0.5*(end-start)
    }
    
    public var ray:Ray {
        return  Ray(origin: start, direction: vector)
    }
}

extension Line {
    
    func intersect(with line:Line) -> Vec2? {
        var intersectionPoint:Vec2?
        
        let p = self
        let q = line
        
        let denominator = (p.vector).cross(q.vector)
        if denominator  != 0 {
            let t = (q.start - p.start).cross(q.vector)/denominator
            let u = (q.start - p.start).cross(p.vector)/denominator
            if ((t > 0.0 && t < 1.0) &&  (u > 0.0 && u < 1.0)) {
                intersectionPoint = self.evaluate(at:t)
            }
        }
        return intersectionPoint
    }   
}

public func intersect(left:Line, right:Line) -> Vec2? {
    return left.intersect(with: right)
}


