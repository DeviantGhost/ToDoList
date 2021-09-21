import UIKit

let block: (Int) -> Void = { total in
    print("Sum of the first 1000 number is \(total)")
}

func sumOfFirstThousandNumber(completion: (Int) -> Void) {
var total = 0
        for i in 1...1000 {
      total = total + i
   }
    
    completion(total)
    
}

sumOfFirstThousandNumber(completion: block)

