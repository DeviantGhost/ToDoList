import UIKit



var rectangleArea = ({ (s1: Int, s2: Int) -> Int in
    return s1 * s2
})

rectangleArea(2,5)


var squareArea = ({ (s1: Int) -> Int in
    return s1 * s1
})

squareArea(5)


var multiply = ({ (s1: Int, s2: Int) -> Int in
    return s1 * s2
})

multiply(2,5)

var divide = ({ (s1: Int, s2: Int) -> Int in
    return s1 / s2
})

divide(10,2)
