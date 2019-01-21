//
//  Square.swift
//  Quiddity
//
//  Created by David Crooks on 21/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

struct Square {
    let size:Double
    let center:Vec2
    
    init(center:Vec2, size:Double) {
        self.center = center
        self.size = size
    }
}
