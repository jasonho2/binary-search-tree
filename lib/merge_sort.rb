def merge_sort(array)
  if array.size <= 1
    return array
  end
  left = merge_sort(array[0...array.size/2])
  right = merge_sort(array[array.size/2...array.size])

  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result + left + right
end

#puts merge_sort([3, 2, 1, 13, 8, 5, 0, 1]).inspect