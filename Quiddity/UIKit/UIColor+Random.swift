import Foundation
import UIKit

extension UIColor {
   
    public static func random(hue h:CGFloat? = nil, saturation s:CGFloat? = nil ,brightness b:CGFloat? = nil,alpha a:CGFloat? = 1.0) -> UIColor {
        let range:ClosedRange<CGFloat> = 0.0...1.0
        return UIColor(hue: h ?? CGFloat.random(in: range), saturation: s ?? CGFloat.random(in: range), brightness: b ?? CGFloat.random(in: range), alpha: a ?? CGFloat.random(in: range))
        
    }
    
}
