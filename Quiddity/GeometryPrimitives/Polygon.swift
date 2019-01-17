//
//  Polygon.swift
//  Quiddity
//
//  Created by David Crooks on 17/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

struct Polygon {
    let verticies:[Vec2]
    
    var edges:[Line] {
        return zip(verticies.dropLast(),verticies.dropFirst()).map(Line.init)
    }
    
    public init(verticies:[Vec2]) {
        self.verticies = verticies
    }
}
