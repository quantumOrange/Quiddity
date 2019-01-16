import Foundation
import CoreGraphics

public func createGridPoints(in rect:CGRect, rows: Int,columns: Int) -> (Int,Int) -> CGPoint {
    
    let num_spaces_x = CGFloat(rows - 1)
    let num_spaces_y = CGFloat(columns - 1)
    
    let spacing = CGPoint(x:rect.size.width/num_spaces_x, y:rect.size.height/num_spaces_y)
    
    return {(i,j) in
        let index = CGPoint(x: i, y: j)
        return rect.origin + index*spacing
    }
}

extension Array2D {
    static public func createGrid(rows: Int, columns: Int, in rect:CGRect) -> Array2D<CGPoint> {
        return Array2D<CGPoint>(rows:rows,columns:columns, f:createGridPoints(in:rect, rows:rows,columns: columns))
    }
}
