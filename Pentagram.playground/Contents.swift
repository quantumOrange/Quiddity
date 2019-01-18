import UIKit
import PlaygroundSupport
import Quiddity



let radius = 150.0
let margin = 5.0
let halfWidth = radius + margin

let drawFrame = CGRect(x:0.0,y:0.0,width:2*halfWidth,height:2*halfWidth)

let circle = Circle(center: Vec2(x:halfWidth, y:halfWidth), radius: radius)
//_ in Double.random(in: 0 ..< 2*Double.pi

let nAnchors = 5
let verticies = (1...nAnchors)
                .map{ Double($0)*2*Double.pi/Double(nAnchors) }
                .map( circle.evaluate )

let anchors = verticies
                .map{ Circle.init(center: $0, radius: margin)}

let lines = zip(verticies, permute(verticies,by: 2))
                .map(Line.init)


let intersectionSpots = zip(lines, permute(lines,by: 1))
    .compactMap(intersect)
    .map{Circle(center: $0, radius: margin)}

///////////////////////// Draw ////////////////////////

let canvasView = CanvasView(frame: drawFrame)
canvasView.backgroundColor = UIColor.white


var paintables = [Paintable(drawable: circle, fill: nil, stroke: Stroke(color: UIColor.black, weight: 2.0))]

paintables += anchors.map {
    Paintable(drawable: $0, fill: UIColor.blue, stroke: nil)
}

paintables += lines.map {
    Paintable(drawable: $0, fill: nil, stroke: Stroke(color: UIColor.black, weight: 2.0))
}

paintables += intersectionSpots.map {
    Paintable(drawable: $0, fill: UIColor.blue, stroke: nil)
}

canvasView.paintables = paintables

PlaygroundPage.current.liveView = canvasView
