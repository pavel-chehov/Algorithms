//Interpolation sort
//Complexity: O log(log(n)), O(n) in worst case
//

import Foundation

let array = [2,4,10,11,18,21,24,29,35,45,78,79,85,92,101,124,128,174,195,204, 1005]

func interpolationSearch(values: [Int], valueForSearch: Int) -> Int? {
    var min = 0
    var max = values.count - 1
    while min < max {
        var mid = min + (max - min) * (valueForSearch - values[min]) / (values[max] - values[min])
        if mid >= values.count {
            mid = values.count - 1
        }
        
        if values[mid] == valueForSearch {
            return mid
        }
        
        if values[mid] < valueForSearch {
            min = mid + 1
        } else {
            max = mid - 1
        }
    }
    return nil
}

let searchedIndex = interpolationSearch(values: array, valueForSearch: 124)
print(searchedIndex)
