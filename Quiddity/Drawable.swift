import Foundation
import CoreGraphics

public protocol Renderer {
    func move(to:Vec2)
    
    func addLine(to:Vec2)
    func addArc(center: Vec2, radius: Double, startAngle: Double, endAngle: Double)
    func addCircle(center: Vec2, radius: Double)
    func addQuadCurve(to: Vec2, control: Vec2)
    
    func fill()
    func stroke()
    func setFill(_ color:Color)
    func setStroke(_ stroke:Stroke)
}

extension CGContext : Renderer {
    public func move(to: Vec2) {
        move(to: CGPoint(to))
    }
    
    public func addLine(to: Vec2) {
        addLine(to: CGPoint(to))
    }
    
    
    public func addQuadCurve(to: Vec2, control: Vec2) {
        addQuadCurve(to:CGPoint(to), control: CGPoint(control))
    }
    
    
    public func stroke() {
        self.strokePath()
    }

    public func fill() {
        self.fillPath()
    }
    
    public func setFill(_ color:Color){
        setFillColor(color.cgColor)
    }
    
    public func setStroke(_ stroke:Stroke){
        setLineWidth(CGFloat(stroke.weight))
        setStrokeColor(stroke.color.cgColor)
    }
   
    public func addArc(center: Vec2, radius: Double, startAngle: Double, endAngle: Double) {
        
        let arc = CGMutablePath()
        
        arc.addArc(center: CGPoint(center), radius: CGFloat(radius),
                   startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: false)
        
        addPath(arc)
    }
    
    public func addCircle(center: Vec2, radius: Double) {
        let origin = center - Vec2(x:radius,y:radius)
        let size = CGSize(width: 2*radius, height: 2*radius)
        let rect = CGRect(origin: CGPoint(origin), size: size)
        addEllipse(in:rect)
    }
    
}

public struct TestRenderer : Renderer {
    
    
    public func setFill(_ color: Color) {
       
    }
    
    public func setStroke(_ stroke: Stroke) {
       
    }
    
    
    public init() {
        
    }
    
    public func fill() {
        print("fill path")
    }
    
    public func stroke() {
        print("stroke")
    }
    
    public func addQuadCurve(to p: Vec2, control: Vec2){
        print("add quadratic bezier to\(p.x), \(p.y)) with control: \(control.x), \(control.y)) ")
    }
    
    public func addLine(to p: Vec2) {
        print("lineTo(\(p.x), \(p.y))")
    }
    
    public func move(to p: Vec2) { print("moveTo(\(p.x), \(p.y))") }
    
    public func addArc(center: Vec2, radius: Double, startAngle: Double, endAngle: Double) {
        print("arcAt(\(center), radius: \(radius)," + " startAngle: \(startAngle), endAngle: \(endAngle))")
    }
    public func addCircle(center: Vec2, radius: Double){
        print("circleAt(\(center), radius: \(radius)")
    }
}

public protocol Drawable {
    func draw(renderer: Renderer)
}

extension Drawable {
    
    func drawPath(withPoints points:[Vec2], renderer: Renderer) {
        guard let first = points.first else { return }
        renderer.move(to: first)
        points.dropFirst().forEach{ renderer.addLine(to: $0) }
    }
    
    func drawLoop(withPoints points:[Vec2], renderer: Renderer) {
        guard let last = points.last else { return }
        renderer.move(to: last)
        points.forEach{ renderer.addLine(to: $0) }
    }
    
}

extension Array : Drawable where Element == Drawable {
    public func draw(renderer: Renderer) {
        forEach{ $0.draw(renderer:renderer) }
    }
}


public struct RGB {
    let r:Float
    let b:Float
    let c:Float
    let a:Float
}

public protocol Color {
    var cgColor:CGColor { get }
}

extension CGColor: Color {
    public var cgColor: CGColor {
        return self
    }
}

public struct Stroke {
    let weight:Double
    let color:Color
    
    public init(color:Color, weight:Double){
        self.weight = weight
        self.color = color
    }
}







