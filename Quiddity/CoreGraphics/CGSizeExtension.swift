//
//  CGSizeExtension.swift
//  demoApp
//
//  Created by David Crooks on 23/01/2015.
//  Copyright (c) 2015 David Crooks. All rights reserved.
//

import Foundation
import UIKit

public extension CGSize {
    
    static func *(lhs: CGFloat,rhs: CGSize) -> CGSize {
        return CGSize(width: lhs * rhs.width, height: lhs * rhs.height)
    }
    
    static func /(lhs: CGSize,rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width / rhs, height:  lhs.height/rhs)
    }
    
    var center:CGPoint {
        return CGPoint(x: width*0.5, y: height*0.5)
    }
    
    var area:CGFloat {
        return width*height
    }
    
}
