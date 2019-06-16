//
//  Evaluable.swift
//  Quiddity
//
//  Created by David Crooks on 18/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

protocol Evaluable {
    func evaluate(at t:Double) -> Vec2
    var  evaluableRange:Range<Double> { get }
    var  mininumEvaluable:Double { get }
    var  maximumEvaluable:Double { get }
}


extension Evaluable {
    var  mininumEvaluable:Double { return  0.0 }
    var  maximumEvaluable:Double { return  1.0 }
}
func  evaluate<E:Evaluable>(primitive e:E, at t:Double) -> Vec2 {
    return e.evaluate(at:t)
}

extension Evaluable {
    
    func createPoints(_ n:Int) -> [Vec2] {
       
        let dx = ( maximumEvaluable - mininumEvaluable ) / Double(n)
        
        return (0..<n)
                    .map { Double($0) * dx }
                    .map { evaluate(at: $0) }
        
        
    }
}
//Ambiguous reference to member 'min(by:)'

extension Circle: Evaluable {
    
    var  mininumEvaluable:Double { return  0.0 }
    var  maximumEvaluable:Double { return  2*Double.pi }
    
    var  evaluableRange:Range<Double> {
        return 0..<2*Double.pi
    }
    public func evaluate(at t:Double) -> Vec2 {
        return center + radius*Vec2(x:cos(t),y:sin(t))
    }
}

extension LineSegment: Evaluable {
    var evaluableRange: Range<Double> {
        return 0.0..<1.0
    }
    
    func evaluate(at t:Double) -> Vec2 {
        return start + t*vector
    }
}

extension Line: Evaluable {
    //TODO: fix ranges
    var evaluableRange: Range<Double> {
        return 0.0..<1.0
    }
    
    public func evaluate(at t:Double) -> Vec2 {
        return origin + t*direction
    }
}

extension NGon {
    var  evaluableRange:Range<Double> {
        return 0..<2*Double.pi
    }
    
    func evaluate(at t:Double) -> Vec2 {
        let n = edges.count
        let p = t*Double(n)/Double.pi
        let index = Int( floor(p)) // 1234
        let frac = p.truncatingRemainder(dividingBy: 1) // 0.56789
        let line = edges[index]
        return line.evaluate(at:frac)
    }
}

extension Polygon:Evaluable {}
extension Triangle:Evaluable {}
extension Quad:Evaluable {}

