class MergeSort {

  func mergeSort(_ source: inout [Int], _ low: Int, _ high: Int) {

    if low >= high {
      return
    }

    let pivot: Int = low + (high - low) / 2
    mergeSort(&source, low, pivot)
    mergeSort(&source, pivot + 1, high)
    merge(&source, low, pivot, high)
  }

  func merge(_ source: inout [Int], _ low: Int, _ pivot: Int, _ high: Int) {

    var total: [Int] = []
    var left: [Int] = []
    var right: [Int] = []
    for i in low...pivot {
      left.append(source[i])
    }
    
    for i in (pivot + 1)...high {
      right.append(source[i])
    }

    print(left)
    print(right)
    var letIndex: Int = 0
    var ritIndex: Int = 0
    while (true) {
      if letIndex >= left.count && ritIndex >= right.count {
        break
      }
      if letIndex < left.count && ritIndex < right.count {
        if left[letIndex] < right[ritIndex] {
          total.append(left[letIndex])
          letIndex += 1
        } else {
          total.append(right[ritIndex])
          ritIndex += 1
        }
      }
      if letIndex < left.count && ritIndex >= right.count {
        total.append(left[letIndex])
        letIndex += 1
      }
      if ritIndex < right.count && letIndex >= left.count {
        total.append(right[ritIndex])
        ritIndex += 1
      }
    }
    print("total: \(total)")
    var bIndex: Int = 0
    for index in low...high {
      source[index] = total[bIndex]
      bIndex += 1
    }
  }
}