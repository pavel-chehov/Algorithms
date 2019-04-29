//Find all simple multiplicators
//Complexity: sqrt(n), excepts ".contains" operation
//

import Foundation

func findSimpleMultiplicators(_ digit: UInt64) -> [UInt64] {
    var multiplicators = [UInt64]()
    var number = digit
    var i: UInt64 = 2
    
    while number % i == 0  {
        if !multiplicators.contains(i) {
            multiplicators.append(i)
        }
        number /= i
    }
    
    i = 3
    var max = UInt64(sqrt(Double(number)))
    while i <= max {
        while number % i == 0 {
            if !multiplicators.contains(i) {
                multiplicators.append(i)
            }
            number /= i
            max = UInt64(sqrt(Double(number)))
        }
        i+=2
    }
    
    if number > 1 {
        multiplicators.append(number)
    }
    
    return multiplicators
}


let bigNumber: UInt64 = 4512349834895892384
let multiplicators = findSimpleMultiplicators(bigNumber)
multiplicators.forEach { i in
    print(i)
}
