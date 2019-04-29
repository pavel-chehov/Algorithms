//Binary search
//Comlexity: log2 n
//
//  Created by Pavel Chehov on 15/03/2019.
//  Copyright © 2019 Pavel Chehov. All rights reserved.
//

import Foundation

let inputArray = [1,2,3,4,5,6,7,8,9,10]

//cycle search
func binarySearch(valueForSearch: Int, array: [Int]) -> Int? {
    let sortedArray = array.sorted {$0 < $1}
    var start = 0
    var end = sortedArray.count - 1
    while start <= end {
        let middlePosition = (start + end)/2
        let middleValue = sortedArray[middlePosition]
        if middleValue == valueForSearch {
            return middlePosition
        }
        if valueForSearch < middleValue {
            end = middlePosition-1
        } else {
            start = middlePosition+1
        }
    }
    return nil
}
//recursively search
func binarySearch(valueForSearch: Int, array: [Int], start: Int, end: Int) -> Int? {
     guard start <= end else {
        return nil
    }
    let middlePosition = (start + end)/2
    let middleValue = array[middlePosition]
    if middleValue == valueForSearch {
        return middlePosition
    }
    if valueForSearch < middleValue {
        return binarySearch(valueForSearch: valueForSearch, array: array, start: start, end: middlePosition - 1)
    } else {
        return binarySearch(valueForSearch: valueForSearch, array: array, start: middlePosition + 1, end: end)
    }
}

var position = binarySearch(valueForSearch: 5, array: inputArray)
print(position)

position = binarySearch(valueForSearch: 5, array: inputArray, start: 0, end: inputArray.count - 1)
print(position)
