import Foundation


public func createGridPoints(in rect:CGRect, rows: Int,columns: Int) -> (Int,Int) -> Vec2 {
    
    let num_spaces_x = CGFloat(rows - 1)
    let num_spaces_y = CGFloat(columns - 1)
    
    let spacing = Vec2(CGPoint(x:rect.size.width/num_spaces_x, y:rect.size.height/num_spaces_y))
    
    return {(i,j) in
        let index = Vec2(x: i, y: j)
        return Vec2(rect.origin) + index*spacing
    }
}

extension Array2D {
    static public func createGrid(rows: Int, columns: Int, in rect:CGRect) -> Array2D<Vec2> {
        return Array2D<Vec2>(rows:rows,columns:columns, f:createGridPoints(in:rect, rows:rows,columns: columns))
    }
}
