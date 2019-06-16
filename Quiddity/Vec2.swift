//
//  Vec2.swift
//  Quiddity
//
//  Created by David Crooks on 17/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

public struct Vec2:Equatable {
    public let x:Double
    public let y:Double
    
    public init(x:Int,y:Int){
        self.x = Double(x)
        self.y = Double(y)
    }
    
    public init(x:Float,y:Float){
        self.x = Double(x)
        self.y = Double(y)
    }
    
    public init(x:Double,y:Double){
        self.x = x
        self.y = y
    }
    
    static var zero:Vec2 {
        return Vec2(x: 0.0, y: 0.0)
    }
}

extension Vec2 {
    public static func == (lhs: Vec2, rhs:Vec2) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}


infix operator •

public func •(_ left: Vec2, right: Vec2) -> Double {
    return  left.x*right.x +  left.y*right.y
}

public func dot(_ left: Vec2, right: Vec2) -> Double {
    //return left • right
    return  left.x*right.x +  left.y*right.y
}

public func +(left: Vec2, right: Vec2) -> Vec2 {
    return Vec2(x: left.x+right.x, y: left.y+right.y)
}

public func -(left: Vec2, right: Vec2) -> Vec2 {
    return Vec2(x: left.x-right.x, y: left.y-right.y)
}

public func *(left: Double, right: Vec2) -> Vec2 {
    return Vec2(x: left*right.x, y:left*right.y)
}

public func *(left: Vec2, right: Vec2) -> Vec2 {
    return Vec2(x: left.x*right.x, y:left.y*right.y)
}

public func /(left: Vec2, right: Double) -> Vec2 {
    return Vec2(x: left.x/right, y:left.y/right)
}

public extension Vec2 {
    
    func distanceTo(_ p: Vec2) -> Double {
        let q = self
        return  (q-p).length
    }
    
    func dot(_ q:Vec2) -> Double {
        let p = self
        return p.x * q.x + p.y * q.y
    }
    
    func cross(_ q:Vec2) -> Double {
        let p = self
        //CHECK SIGN!
        return p.x * q.y - p.y * q.x
    }
    
    func angle(_ q:Vec2) -> Double {
        let c = self.dot(q) / (self.length    * q.length)
        return acos(c)
    }
    
    
    //The range of the angle is -π to π; an angle of 0 points to the right.
    var angle: Double {
        return atan2(y, x)
    }

    var length:Double {
        return sqrt(x*x + y*y)
    }
    
    var normalized:Vec2 {
        let l = length
        return Vec2(x: x/l, y: y/l)
    }
    
    var lengthSquared:Double {
        return x*x + y*y
    }
    
    var isValid:Bool {
        if self.x.isNaN || self.y.isNaN {
            return false
        }
        return true
    }
    
    var orthogonal:Vec2 {
        return Vec2(x: -y, y: x)
    }
}


extension Vec2 {
    
    public static func gaussian() -> Vec2 {
        //Box-Muller transform
        //https://en.wikipedia.org/wiki/Box%E2%80%93Muller_transform
        let u = Double.random(in: 0..<1)
        let v = Double.random(in: 0..<1)
        
        let r = sqrt(-2.0*log(u))
        let theta = 2*Double.pi*v
        
        return Vec2(x: r*cos(theta), y: r*sin(theta))
    }
    
}

func relativeAngle(_ u:Vec2, _ v:Vec2) -> Double {
    //angle of v relative to u
    var theta = atan2(v.y,v.x) - atan2(u.y,u.x)
    
    if theta < -Double.pi  {
        theta += 2*Double.pi
    }
    if theta > Double.pi {
        theta -= 2*Double.pi
    }
    
    return theta
}
