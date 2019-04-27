//
//  Quad.swift
//  Quiddity
//
//  Created by David Crooks on 17/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

public struct Quad {
    
    public let a:Vec2
    public let b:Vec2
    public let c:Vec2
    public let d:Vec2

    
    public init(a:Vec2,b:Vec2, c:Vec2, d:Vec2){
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    //Edges
    public var ab:LineSegment {
        return LineSegment(start: a, end: b)
    }
    
    public var bc:LineSegment {
        return LineSegment(start: b, end: c)
    }
    
    public var cd:LineSegment {
        return LineSegment(start: c, end: d)
    }
    
    public var da:LineSegment {
        return LineSegment(start: d, end: a)
    }
    
    //Diagonals
    public var ac:LineSegment {
        return LineSegment(start: a, end: c)
    }
    
    public var db:LineSegment {
        return LineSegment(start: d, end: b)
    }
    
    public var center:Vec2? {
        let lineAC = LineSegment(start: a,end: c)
        let lineDB = LineSegment(start: d,end: b)
        
        return lineAC.intersect(with:lineDB)
    }
    
    public var centroid:Vec2 {
        //The centroid is the midpoint of the line joining the midpoints of the diagonals:
        return LineSegment(start: ac.midPoint,end: db.midPoint).midPoint
    }
    
    //Mark: -interior angles
    public var angleA:Double {
        return ab.vector.angle(Vec2.zero - da.vector)
    }
    
    public var angleB:Double {
        return bc.vector.angle(Vec2.zero - ab.vector)
    }
    
    public var angleC:Double {
        
        return cd.vector.angle(Vec2.zero - bc.vector)
    }
    
    public var angleD:Double {
        return da.vector.angle( Vec2.zero - cd.vector)
    }
    
    public var isConvex:Bool  {
        let lineAC = LineSegment(start: a,end: c)
        let lineDB = LineSegment(start: d,end: b)
        
        //a quadrilatteral is convex iff its diagonal line segments interesect
        if let _ = lineAC.intersect(with:lineDB){
            return true
        }
        else
        {
            return false
        }
    }
    
    public var area:Double {
        let (t1,t2) = triangulate()
        
        return t1.area + t2.area
    }
    
    func triangulate() -> (Triangle,Triangle) {
        let lineAC = LineSegment(start: a,end: c)
        let lineDB = LineSegment(start: d,end: b)
        
        let rayAC = Line(lineSegment: lineAC)
        
        if let _ = rayAC.intersect(with: lineDB){
            //both trinagles share commone verticies A and C
            return (Triangle(A: a, B: b, C: c),Triangle(A: a, B: c, C: d))
        }
        else {
            //both trinagles share common verticies B and D
            return (Triangle(A: a, B: b, C: d),Triangle(A: b, B: c, C: d))
        }
    }
    
    func containsPoint(_ p:Vec2) -> Bool {
        
        let (triangle1,triangle2) = triangulate()
        
        
        
        return triangle1.contains(point: p) || triangle2.contains(point: p)
       
    }

    public var isValid:Bool {
        return a.isValid && b.isValid && c.isValid && d.isValid
    }
    
}


extension Quad:CustomStringConvertible {
    public var description: String { return "Quad A:\(a) B:\(b) C:(\(c) D:\(d)  centroid:\(centroid)" }
}
