//
//  Style.swift
//  Quiddity
//
//  Created by David Crooks on 19/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

public struct Style {
    public let fill:Color?
    public let stroke:Stroke?
    
    public init(fill:Color?, stroke:Color?, weight:Double = 1.0){
        self.fill = fill
        if let strokeColor = stroke {
            self.stroke = Stroke(color: strokeColor, weight: weight)
        }
        else {
            self.stroke = nil
        }
    }
    
    public static var defaultStyle:Style {
        return Style(fill:UIColor(white: 0.5, alpha: 0.5), stroke: UIColor.black)
    }
}

public struct Stroke {
    public let weight:Double
    public let color:Color
    
    public init(color:Color, weight:Double = 1.0){
        self.weight = weight
        self.color = color
    }
}







