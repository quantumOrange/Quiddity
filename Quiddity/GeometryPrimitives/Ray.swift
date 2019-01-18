//
//  Ray.swift
//  Quiddity
//
//  Created by David Crooks on 18/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation


struct Ray {
    let origin:Vec2
    let direction:Vec2
    
    init(origin:Vec2,direction:Vec2) {
        self.direction = direction.normalized
        self.origin = origin
    }
}

extension Ray {
    
    func intersect(with ray:Ray) -> Vec2? {
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
}
