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
    
    func cutEar() -> (ear:Triangle?,poly:Polygon){
        //TODO: fix this. Cut off an ear, return the ear and remaining polygon
        
        return (nil,self)
    }
    
    func triangulate() -> [Triangle] {
       
        let (triangle, polygon)  = cutEar()
        
        if let triangle = triangle {
            return polygon.triangulate() + [triangle]
        }
        else if (polygon.verticies.count == 3 ) {
            return [Triangle(A: polygon.verticies[0], B: polygon.verticies[1], C: polygon.verticies[2])]
        }
        else {
            return []
        }
        
    }

}

protocol NGon:Equatable {
    var verticies:[Vec2] {get}
    
    var edges:[LineSegment] {get}
}

extension NGon {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.verticies.isEqualUpToPermutation(other:rhs.verticies)
    }
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
