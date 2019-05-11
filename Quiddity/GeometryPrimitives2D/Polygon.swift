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
    
    func isEar(index i:Int) -> Bool {
        func containsOtherVertex()->Bool{
            
            let triangle = Triangle(A: vertex(at:i-1 ), B: vertex(at:i-1 ), C: vertex(at:i+1 ))
            
            for j in 0..<verticies.count{
                //exclude the triangles own verticies
                let i_plus = ( verticies.count + i + 1 ) % verticies.count
                let i_minus = ( verticies.count + i - 1 ) % verticies.count
                let isTriangleVertex  = ( j == i || j == i_plus || j == i_minus )
                
                if !isTriangleVertex {
                    if triangle.contains(point: vertex(at: j)) {
                        //this other vertex is inside the triangle of the vertex we are checking
                        return true
                    }
                }
            }
            
            //none of the other vertices is inside the triangle of the vertex we are checking
            return false
        }
        
        //1) check that the vertex is convex
        let convex = interiorAngle(at: i) < Double.pi
        
        //2) check that none of the other vertices of the polygon are inside the triangle
        let containsVertex = containsOtherVertex()
        
        return convex && !containsVertex;
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
        let i = ( verticies.count + index ) % verticies.count
        return verticies[i]
    }
    
    func interiorAngle(at i:Int) -> Double {
        let v1 = vertex(at:i) - vertex(at:i-1)
        let v2 = vertex(at:i+1) - vertex(at:i)
        //TODO: - fix
        //this is not right yet as the sign will depend on if we are going clockwise or anitclockwise around a simle polygon
        return Double.pi - relativeAngle(v1, v2)
    }
    
    func exteriorAngle(at i:Int) -> Double {
        return 2.0*Double.pi - interiorAngle(at: i)
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
