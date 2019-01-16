import Foundation

public struct Array2D<T> {
    
    let rows: Int, columns: Int
    public var values: [T]
    
    public init(rows: Int, columns: Int,value:T) {
        self.rows = rows
        self.columns = columns
        self.values = Array(repeating: value, count: rows * columns)
    }
    
    public init?(rows: Int, columns: Int, values:[T]){
        self.rows = rows
        self.columns = columns
        if(rows * columns != values.count) { return nil }
        self.values = values
        
    }
    
    public init(rows: Int, columns: Int, f: (Int,Int) -> T) {
        self.rows = rows
        self.columns = columns
        
        let range = 0..<rows * columns
        
        self.values = range.map{ index in
            let row = index / columns
            let column = index % columns
            return f(row,column)
        }
    }
    
    public func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    public subscript(row: Int, column: Int) -> T {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return values[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            values[(row * columns) + column] = newValue
        }
    }
    
}

extension Array2D {
    
    public func map<S>(_ transform:(T)->S) -> Array2D<S> {
        let transformedValues =  values.map(transform)
        return Array2D<S>(rows:rows,columns:columns,values:transformedValues)!
    }
    
    public func enumerated() -> Array2D<(Int,Int,T)>{
        let enmeratedValues:[(Int,Int,T)] = values.enumerated().map{ (arg) in
            let (index, value) = arg
            let row = index / columns
            let column = index % columns
            assert(index == (row * columns) + column)
            return (row, column,value)
        }
        
        return Array2D<(Int,Int,T)>(rows:rows, columns:columns, values: enmeratedValues)!
    }
}


public func zip<S,T>(_ s:Array2D<S>,_ t:Array2D<T>) -> Array2D<(S,T)> {
    let zippedValues = Array(Swift.zip(s.values,t.values))
    let (largestRows,largestColumns) = s.values.count > t.values.count ? (s.rows,s.columns) : (t.rows,t.columns)
    return Array2D<(S,T)>(rows: largestRows, columns: largestColumns, values: zippedValues)!
}

extension Array2D {
    static public func create(rows: Int, columns: Int) -> Array2D<(Int,Int)> {
        return Array2D<(Int,Int)>(rows:rows,columns:columns, f:identity)
    }
}

