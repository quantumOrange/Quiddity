//
//  Rect.swift
//  Quiddity
//
//  Created by David Crooks on 21/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

struct Rect {
    let width:Double
    let height:Double
    let center:Vec2
    
    init(center:Vec2, width:Double,height:Double) {
        self.center = center
        self.width = width
        self.height = height
    }
    
}

extension Rect {
    var area:Double {
        return width * height
    }
}
