//
//  Color.swift
//  Quiddity
//
//  Created by David Crooks on 19/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

public struct RGB {
    let r:Float
    let b:Float
    let c:Float
    let a:Float
}

public struct HSB {
    let h:Float
    let s:Float
    let b:Float
    let a:Float
}

public protocol Color {
    var cgColor:CGColor { get }
}

extension CGColor: Color {
    public var cgColor: CGColor {
        return self
    }
}
