import Foundation
import CoreGraphics

public protocol Renderer {
    func move(to:CGPoint)
    
    func addLine(to:CGPoint)
    func addArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat)
    func addCircle(center: CGPoint, radius: CGFloat)
    func addQuadCurve(to: CGPoint, control: CGPoint)
    
    func fill()
    func stroke()
    func setFill(_ color:Color)
    func setStroke(_ stroke:Stroke)
}

extension CGContext : Renderer {
    
    public func stroke() {
        
    }

    public func fill() {
        self.fillPath()
    }
    
    public func setFill(_ color:Color){
        setFillColor(color.cgColor)
    }
    
    public func setStroke(_ stroke:Stroke){
        setLineWidth(stroke.weight)
        setStrokeColor(stroke.color.cgColor)
    }
   
    public func addArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat) {
        
        let arc = CGMutablePath()
        
        arc.addArc(center: center, radius: radius,
                   startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        addPath(arc)
    }
    
    public func addCircle(center: CGPoint, radius: CGFloat) {
        let origin = center - CGPoint(x:radius,y:radius)
        let size = CGSize(width: 2*radius, height: 2*radius)
        let rect = CGRect(origin: origin, size: size)
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
    
    
    public func addQuadCurve(to p: CGPoint, control: CGPoint){
        print("add quadratic bezier to\(p.x), \(p.y)) with control: \(control.x), \(control.y)) ")
    }
    
    public func addLine(to p: CGPoint) {
        print("lineTo(\(p.x), \(p.y))")
    }
    
    public func move(to p: CGPoint) { print("moveTo(\(p.x), \(p.y))") }
    
    public func addArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat) {
        print("arcAt(\(center), radius: \(radius)," + " startAngle: \(startAngle), endAngle: \(endAngle))")
    }
    public func addCircle(center: CGPoint, radius: CGFloat){
        print("circleAt(\(center), radius: \(radius)")
    }
}

public protocol Drawable {
    func draw(renderer: Renderer)
}

extension Drawable {
    
    func drawPath(withPoints points:[CGPoint], renderer: Renderer) {
        guard let first = points.first else { return }
        renderer.move(to: first)
        points.dropFirst().forEach{ renderer.addLine(to: $0) }
    }
    
    func drawLoop(withPoints points:[CGPoint], renderer: Renderer) {
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

extension Circle : Drawable {
    public func draw(renderer: Renderer) {
        renderer.addCircle(center: center, radius: radius)
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
    let weight:CGFloat
    let color:Color
}

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






