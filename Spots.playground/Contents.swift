//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Quiddity

let drawFrame = CGRect(x:0.0,y:0.0,width:500,height:500)
let radius = CGFloat(20)
let rows = 10

let canvas = CGCanvas(frame: drawFrame)
canvas.backgroundColor = UIColor.white

//Create a grid of CGPoints
let innerFrame = drawFrame.insetBy(dx: radius, dy: radius)
let grid = Array2D<(CGPoint,CGPoint)>.createGrid(rows: rows, columns: rows, in: innerFrame)


func randomFill<A:Drawable>(_ drawable:A) -> Paintable {
    return Paintable(drawable: drawable, fill:UIColor.random(saturation:1.0,brightness:1.0,alpha:1.0).cgColor, stroke: nil)
}

canvas.paintables =  grid
                    .map{ Circle(center: $0, radius: radius)}
                    .map(randomFill)
                    .values


PlaygroundPage.current.liveView = canvas
