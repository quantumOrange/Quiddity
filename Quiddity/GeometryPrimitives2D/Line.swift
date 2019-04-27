//
//  Ray.swift
//  Quiddity
//
//  Created by David Crooks on 18/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation


public struct Line {
    public let origin:Vec2
    public let direction:Vec2
    
    public init(origin:Vec2,direction:Vec2) {
        self.direction = direction.normalized
        self.origin = origin
    }
    
    public init(lineSegment line:LineSegment) {
        self.direction = line.vector.normalized
        self.origin = line.start
    }
}

extension Line {
    
    public func intersect(with line:Line) -> Vec2? {
        
        var intersectionPoint:Vec2?
        
        let denominator = (self.direction).cross(line.direction)
        
        if denominator  != 0 {
            let t = (line.origin - self.origin).cross(line.direction)/denominator
            intersectionPoint = self.evaluate(at:t)
        }
        
        return intersectionPoint
        
    }
    
    func intersect(with line:LineSegment) -> Vec2? {
        
        var intersectionPoint:Vec2?
        
        let denominator = (self.direction).cross(line.vector)
        
        if denominator  != 0 {
            let t = (line.start - self.origin).cross(line.vector)/denominator
            let u = (line.start - self.origin).cross(self.direction)/denominator
            if (u > 0.0 && u < 1.0){
                intersectionPoint = self.evaluate(at:t)
            }
        }
        
        return intersectionPoint
    }
}
