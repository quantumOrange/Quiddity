import UIKit
import PlaygroundSupport
import Quiddity

let drawFrame = CGRect(x:0.0,y:0.0,width:500,height:500)
let radius = 20.0
let rows = 10

let canvasView = CanvasView(frame: drawFrame)
canvasView.backgroundColor = UIColor.white

//Create a grid of CGPoints
let innerFrame = drawFrame.insetBy(dx: CGFloat(radius), dy: CGFloat(radius))
let grid = Array2D<(Vec2,Vec2)>.createGrid(rows: rows, columns: rows, in: innerFrame)


func randomFill<A:Drawable>(_ drawable:A) -> Paintable {
    return Paintable(drawable: drawable, fill:UIColor.random(saturation:1.0,brightness:1.0,alpha:1.0).cgColor, stroke: nil)
}

canvasView.paintables =  grid
                    .map{ Circle(center: $0, radius: radius)}
                    .map(randomFill)
                    .values

PlaygroundPage.current.liveView = canvasView
