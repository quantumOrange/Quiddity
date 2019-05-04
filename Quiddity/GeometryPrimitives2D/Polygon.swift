//
//  Polygon.swift
//  Quiddity
//
//  Created by David Crooks on 17/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

public struct Polygon: NGon {
    
    public let verticies:[Vec2]
    
    public var edges:[LineSegment] {
        return zip(verticies.dropLast(),verticies.dropFirst()).map(LineSegment.init)
    }
    
    public init(verticies:[Vec2]) {
        self.verticies = verticies
    }
    
    func isEar(index:Int) -> Bool {
        //1) check that the vertex is convex
        //2) check that none of the other vertices of the polygon are inside the triangle
        return false;
    }
    
    func cutEar() -> (ear:Triangle?,poly:Polygon){
        //TODO: fix this. Cut off an ear, return the ear and remaining polygon
        for i in 0..<verticies.count {
            if isEar(index: i){
                var reducedVerticies = verticies
                let earVertex = reducedVerticies.remove(at: i)
                return ( Triangle(A: vertex(at: i-1), B: earVertex, C: vertex(at: i+1)),
                         Polygon(verticies:reducedVerticies ))
            }
        }
        return (nil,self)
    }
    
    public func triangulate() -> [Triangle] {
       
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

extension NGon {
    
    func vertex(at index:Int) -> Vec2 {
        let i = index % verticies.count
        return verticies[i]
    }
    
    func interiorAngle(at i:Int) -> Double {
        let v1 = vertex(at:i) - vertex(at:i-1)
        let v2 = vertex(at:i+1) - vertex(at:i)
        //interior???
        return Double.pi - v1.angle(v2)
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
