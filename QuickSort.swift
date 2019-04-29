//Quick sort by Hoar approach
//Complexity: n log(n)
//

import Foundation

var inputArray = [2, 1, 3, 8, 0, -8, -18, 2, 0, 7, 24, 9]

func quickSort (array: inout [Int], start: Int, end: Int) {
    let pivot = array[(start + end)/2]
    var left = start
    var right = end
    
    while left <= right {
        //moves left ponter to the right side
        while array[left] < pivot {
            left+=1
        }
        //moves right pointer to the left side
        while array[right] > pivot {
            right-=1
        }
        
        if left <= right {
            //swap
            let temp = array[left]
            array[left] = array[right]
            array[right] = temp
            left+=1
            right-=1
        }
    }
    //sort less digits (left array side)
    if right > start {
        quickSort(array: &array, start: start, end: right)
    }
    //sort greater digits (right array side)
    if left < end {
        quickSort(array: &array, start: left, end: end)
    }
}

quickSort(array: &inputArray, start: 0, end: inputArray.count - 1)
print(inputArray)
