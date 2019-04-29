//Counting sort
//Complexity: O(n + m), if m < n,
//this algorithm will be faster then n*log(n) agorithms
//

import Foundation

var values = [5,7,8,1,2,6,7,10]

func countingSort(values: inout [Int], maxValue: Int) {
    //define array for counters for every digit in values array.
    //count array may be larger than the array of values, because it contains 0 counters for nonexistent values.
    var counts = [Int](repeating: 0, count: maxValue + 1)
    
    //get every value from values and increase counter for this value
    for i in 0..<values.count {
        counts[values[i]] = counts[values[i]] + 1
    }
    
    //get counter for every digit in 0...maxValue
    //and inserts this digit in values array by counter times
    var index = 0
    for i in 0...maxValue {
        if counts[i] == 0 {
            continue
        }
        for _ in 1...counts[i] {
            values[index] = i
            index += 1
        }
    }
}

countingSort(values: &values, maxValue: values.max()!)
print(values)
