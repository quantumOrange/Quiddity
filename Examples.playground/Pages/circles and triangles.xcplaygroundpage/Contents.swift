
import UIKit
import PlaygroundSupport
import Quiddity

let width = 400.0
let drawFrame = CGRect(x:0.0,y:0.0,width:width,height:width)
let canvasView = CanvasView(frame: drawFrame)
canvasView.backgroundColor = UIColor.white
let stroke = Stroke(color: UIColor.black, weight: 2.0)


func randomTriangle(at p:Vec2) -> Triangle {
    let size = 60.0
    
    let A = p + size * Vec2.gaussian()
    let B = p + size * Vec2.gaussian()
    let C = p + size * Vec2.gaussian()
    
    return Triangle(A: A, B: B, C: C)
}

let triangles = [Vec2(x: 160, y: 160), Vec2(x: 200, y: 190),Vec2(x: 230, y: 200)]
    .map(randomTriangle)


let circles = triangles.compactMap(Circle.init)
    


let intersections = zip(circles,permute(circles,by:1))
                    .flatMap(intersect)

let anchors:[Drawable] = intersections.map {
                    return Circle(center: $0, radius: 10)
                }

var drawables:[Drawable] = circles + anchors

if let triangles = triangles as? [Drawable] {
drawables += triangles
}


canvasView.paintables = [Paintable(drawable: drawables, fill:nil, stroke: stroke)]


    

PlaygroundPage.current.liveView = canvasView
