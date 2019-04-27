//
//  Polygon.swift
//  Quiddity
//
//  Created by David Crooks on 17/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

struct Polygon: NGon {
    let verticies:[Vec2]
    
    var edges:[LineSegment] {
        return zip(verticies.dropLast(),verticies.dropFirst()).map(LineSegment.init)
    }
    
    public init(verticies:[Vec2]) {
        self.verticies = verticies
    }
}

protocol NGon {
    var verticies:[Vec2] {get}
    
    var edges:[LineSegment] {get}
}

extension Triangle:NGon {
    var verticies: [Vec2] {
        return [a,b,c]
    }
    
    var edges: [LineSegment] {
         return [ ab, bc, ca]
    }
}

extension Quad:NGon {
    var verticies: [Vec2] {
         return [a,b,c,d]
    }
    
    var edges: [LineSegment] {
        return [ab,bc,cd,da]
    }
}
