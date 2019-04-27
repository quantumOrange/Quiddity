//
//  Ray.swift
//  Quiddity
//
//  Created by David Crooks on 18/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation


public struct Ray {
    public let origin:Vec2
    public let direction:Vec2
    
    public init(origin:Vec2,direction:Vec2) {
        self.direction = direction.normalized
        self.origin = origin
    }
    
    public init(lineSegment line:Line) {
        self.direction = line.vector.normalized
        self.origin = line.start
    }
}

extension Ray {
    
    public func intersect(with ray:Ray) -> Vec2? {
        
        var intersectionPoint:Vec2?
        
        let p = self
        let q = ray
        
        let denominator = (p.direction).cross(q.direction)
        
        if denominator  != 0 {
            let t = (q.origin - p.origin).cross(q.direction)/denominator
            intersectionPoint = self.evaluate(at:t)
        }
        
        return intersectionPoint
        
    }
    
    func intersect(with line:Line) -> Vec2? {
        
        var intersectionPoint:Vec2?
        
        let p = self
        let q = line
        
        let denominator = (p.direction).cross(q.vector)
        
        if denominator  != 0 {
            let t = (q.start - p.origin).cross(q.vector)/denominator
            let u = (q.start - p.origin).cross(p.direction)/denominator
            if (u > 0.0 && u < 1.0){
                intersectionPoint = self.evaluate(at:t)
            }
        }
        
        return intersectionPoint
    }
}
