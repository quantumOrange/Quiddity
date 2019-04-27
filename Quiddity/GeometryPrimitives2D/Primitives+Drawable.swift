//
//  Primitives+Drawable.swift
//  Quiddity
//
//  Created by David Crooks on 17/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import Foundation

extension Circle : Drawable {
    public func draw(renderer: Renderer) {
        renderer.addCircle(center: center, radius: radius)
    }
}


extension Line: Drawable {
    public func draw(renderer: Renderer) {
        renderer.move(to: start)
        renderer.addLine(to: end)
    }
}

extension Triangle: Drawable {
    public func draw(renderer: Renderer) {
        renderer.move(to: a)
        renderer.addLine(to: b)
        renderer.addLine(to: c)
        renderer.addLine(to: a)
    }
}

extension Quad: Drawable {
    public func draw(renderer: Renderer) {
        renderer.move(to: a)
        renderer.addLine(to: b)
        renderer.addLine(to: c)
        renderer.addLine(to: d)
        renderer.addLine(to: a)
    }
}

extension Polygon: Drawable {
    public func draw(renderer: Renderer) {
        guard let last = verticies.last else{ return }
        renderer.move(to: last)
        verticies.forEach {
            renderer.addLine(to: $0)
        }
    }
}




