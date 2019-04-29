//Recursive summ
//Complexity: n + 1
//

import Foundation

let inputArray = [1,2,3,4,5,6,7,8,9,10]
func summ(array: [Int]) -> Int {
    guard let first = array.first else {
        return 0
    }
    return first + summ(array: Array(array.dropFirst()))
}

let result = summ(array: inputArray)
print(result)
