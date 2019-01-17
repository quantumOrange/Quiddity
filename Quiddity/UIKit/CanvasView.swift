import Foundation
import UIKit

public class CanvasView:UIView {
    
    public var paintables:[Paintable]=[] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        paintables.forEach {
            $0.paint(renderer:context)
        }
        
    }
    
}
