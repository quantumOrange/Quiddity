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
    
    var edges:[Line] {
        return zip(verticies.dropLast(),verticies.dropFirst()).map(Line.init)
    }
    
    public init(verticies:[Vec2]) {
        self.verticies = verticies
    }
}

protocol NGon {
    var verticies:[Vec2] {get}
    
    var edges:[Line] {get}
}

extension Triangle:NGon {
    var verticies: [Vec2] {
        return [a,b,c]
    }
    
    var edges: [Line] {
         return [ ab, bc, ca]
    }
}

extension Quad:NGon {
    var verticies: [Vec2] {
         return [a,b,c,d]
    }
    
    var edges: [Line] {
        return [ab,bc,cd,da]
    }
}
