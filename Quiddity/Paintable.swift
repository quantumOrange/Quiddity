//
//  Paintable.swift
//  Quiddity
//
//  Created by David Crooks on 15/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

public struct Paintable {
    public init(drawable:Drawable, fill:Color?, stroke:Stroke? ){
        self.drawable = drawable
        self.fill = fill
        self.stroke = stroke
    }
    
    let drawable:Drawable
    let fill:Color?
    let stroke:Stroke?
    
    func paint(renderer:Renderer) {
        if let fillColor = fill {
            renderer.setFill(fillColor)
            drawable.draw(renderer:renderer)
            renderer.fill()
        }
        if let stroke = stroke {
            renderer.setStroke(stroke)
            drawable.draw(renderer:renderer)
            renderer.stroke()
        }
    }
}
