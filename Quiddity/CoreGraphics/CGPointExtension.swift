//
//  CGPointExtension.swift
//  demoApp
//
//  Created by David Crooks on 23/01/2015.
//  Copyright (c) 2015 David Crooks. All rights reserved.
//

import Foundation
import UIKit

infix operator •

func •(_ left: CGPoint, right: CGPoint) -> CGFloat {
    return  left.x*right.x +  left.y*right.y
}

public func dot(_ left: CGPoint, right: CGPoint) -> CGFloat {
    //return left • right
    return  left.x*right.x +  left.y*right.y
}

public func +(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x+right.x, y: left.y+right.y)
}

public func -(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x-right.x, y: left.y-right.y)
}

public func *(left: CGFloat, right: CGPoint) -> CGPoint {
    return CGPoint(x: left*right.x, y:left*right.y)
}

public func *(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x*right.x, y:left.y*right.y)
}

public func *(left: CGPoint, right: CGVector) -> CGPoint {
    return CGPoint(x: left.x*right.dx, y:left.y*right.dy)
}

public func *(left: CGPoint, right: CGAffineTransform) -> CGPoint {
    return left.applying(right)
}

public func *(left: CGPoint, right: CATransform3D) -> CGPoint {
    return applyTransform3D(transform: right, to:left)
}


public func /(left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x/right, y:left.y/right)
}


public extension CGPoint {

    public func distanceTo(_ p: CGPoint) -> CGFloat {
        let q = self
        return  (q-p).length
    }
    
    public func dot(_ q:CGPoint) -> CGFloat {
        let p = self
        return p.x * q.x + p.y * q.y
    }
    
    public func cross(_ q:CGPoint) -> CGFloat {
        let p = self
        //CHECK SIGN!
        return p.x * q.y - p.y * q.x
    }
    
    public func angle(_ q:CGPoint) -> CGFloat {
        let c = self.dot(q) / (self.length    * q.length)
        return acos(c)
    }
    
    //The range of the angle is -π to π; an angle of 0 points to the right.
    public var angle: CGFloat {
        return atan2(y, x)
    }
    
    public var length:CGFloat {
        return sqrt(x*x + y*y)
    }
    
    public var normalized:CGPoint {
        let l = length
        return CGPoint(x: x/l, y: y/l)
    }
   
    public var lengthSquared:CGFloat {
        return x*x + y*y
    }

    public var isValid:Bool {
        if self.x.isNaN || self.y.isNaN {
            return false
        }
        return true
    }
}

public func applyTransform3D(transform M: CATransform3D, to p:CGPoint) -> CGPoint {
    var q = CGPoint.zero
    let pz:CGFloat = 1.0
    
    let pw:CGFloat = 1.0
    
    let  w = M.m14*p.x + M.m24*p.y + M.m34*pz + M.m44*pw
    q.x = (M.m11*p.x + M.m21*p.y + M.m31*pz + M.m41*pw)/w
    q.y = (M.m12*p.x + M.m22*p.y + M.m32*pz + M.m42*pw)/w
    
    return q
}

public func midPoint(start:CGPoint, end:CGPoint) -> CGPoint {
    return  start + 0.5*(end-start)
}
