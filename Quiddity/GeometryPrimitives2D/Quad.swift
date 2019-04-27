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
    public var ab:Line {
        return Line(start: a, end: b)
    }
    
    public var bc:Line {
        return Line(start: b, end: c)
    }
    
    public var cd:Line {
        return Line(start: c, end: d)
    }
    
    public var da:Line {
        return Line(start: d, end: a)
    }
    
    //Diagonals
    public var ac:Line {
        return Line(start: a, end: c)
    }
    
    public var db:Line {
        return Line(start: d, end: b)
    }
    
    public var center:Vec2? {
        let lineAC = Line(start: a,end: c)
        let lineDB = Line(start: d,end: b)
        
        return lineAC.intersect(with:lineDB)
    }
    
    public var centroid:Vec2 {
        //The centroid is the midpoint of the line joining the midpoints of the diagonals:
        return Line(start: ac.midPoint,end: db.midPoint).midPoint
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
        let lineAC = Line(start: a,end: c)
        let lineDB = Line(start: d,end: b)
        
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
        let t1 = Triangle(A: a, B: b, C: c)
        let t2 = Triangle(A: b, B: c, C: d)
        return t1.area + t2.area
    }
    
    func containsPoint(_ p:Vec2) -> Bool {
        //this is only valid if the quad is convex
        
        let in1 = Triangle(A: a, B: b, C: c).contains(point:p)
        let in2 = Triangle(A: b, B: c, C: d).contains(point:p)
        let in3 = Triangle(A: c, B: d, C: a).contains(point:p)
        let in4 = Triangle(A: d, B: a, C: b).contains(point:p)
        
        return in1 || in2 || in3 || in4
    }

    public var isValid:Bool {
        return a.isValid && b.isValid && c.isValid && d.isValid
    }
    
}


extension Quad:CustomStringConvertible {
    public var description: String { return "Quad A:\(a) B:\(b) C:(\(c) D:\(d)  centroid:\(centroid)" }
}
