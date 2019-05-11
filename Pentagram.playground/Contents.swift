import UIKit
import PlaygroundSupport
import Quiddity

let radius = 200.0
let margin = 10.0
let halfWidth = radius + margin

let drawFrame = CGRect(x:0.0,y:0.0,width:2*halfWidth,height:2*halfWidth)

let circle = Circle(center: Vec2(x:halfWidth, y:halfWidth), radius: radius)

func ngram(verticies:[Vec2]) -> ([LineSegment],[Vec2],[Triangle]) {
    let lines = zip(verticies, permute(verticies,by: 2))
        .map(LineSegment.init)
    
    let intersections = zip(lines, permute(lines,by: 1))
        .compactMap(intersect)
    
    let triangles = zip(zip(intersections,permute(intersections, by: 1)),permute(verticies, by:2))
        .map{ Triangle(A: $0.0.0, B: $0.0.1, C: $0.1)}
    
    return (lines,intersections,triangles)
}

let nVerticies = 5

let verticies = (1...nVerticies)
        .map{ Double($0)*2*Double.pi/Double(nVerticies) }
        .map( circle.evaluate )

let (lines, intersections, triangles) = ngram(verticies:verticies)

let anchors = (verticies + intersections)
        .map{ Circle.init(center: $0, radius: margin)}


///////////////////////// Draw ////////////////////////

let canvasView = CanvasView(frame: drawFrame)
canvasView.backgroundColor = UIColor.white

var paintables = [Paintable(drawable: circle, fill: nil, stroke: Stroke(color: UIColor.black, weight: 2.0))]

paintables += triangles.map {
    Paintable(drawable: $0, fill: UIColor.yellow, stroke: nil)
}

paintables += lines.map {
    Paintable(drawable: $0, fill: nil, stroke: Stroke(color: UIColor.black, weight: 2.0))
}

paintables += anchors.map {
    Paintable(drawable: $0, fill: UIColor.blue, stroke: nil)
}

canvasView.paintables = paintables

PlaygroundPage.current.liveView = canvasView
