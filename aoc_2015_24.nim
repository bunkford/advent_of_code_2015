import math, sequtils, algorithm

const input = @[1,3,5,11,13,17,19,23,29,31,37,41,43,47,53,59,67,71,73,79,83,89,97,101,103,107,109,113]

# part1: @[1, 83, 101, 103, 107, 113] Weight: 508 QE: 10439961859
# part2: @[1, 59, 101, 107, 113] Weight: 381 QE: 72050269
# This isn't pretty

iterator choose*[T](a: openarray[T], num_choose: int): seq[T] =
  var
    chosen = newSeqOfCap[T](num_choose)
    i = 0
    i_stack = newSeqOfCap[int](num_choose)
  
  while true:
    if chosen.len == num_choose:
      yield chosen
      discard chosen.pop()
      i = i_stack.pop() + 1
    elif i != a.len:
      chosen.add(a[i])
      i_stack.add(i)
      inc i
    elif i_stack.len > 0:
      discard chosen.pop()
      i = i_stack.pop() + 1
    else:
      break
  
proc mlt*(s:seq[int]):BiggestInt =
  result = 1
  for i in s:
    result *= i

proc solve1(numbers:seq[int], target:int):BiggestInt =
  var nums = numbers.sorted(cmp[int], SortOrder.Ascending)

  var r:seq[int64]
  while true:
    r.insert(nums.pop())
    while r.sum() < target:
      if r.sum() + nums[^1] > target:
        var i = nums.high
        while r.sum() + nums[i] > target:
          dec(i)
        r.insert(nums[i])
        nums.delete(i, i)
      else:
        r.insert(nums.pop())
      
    
    if r.sum() == target: # this gets us the min number of presents required to meet target weight
      var last: seq[int]
      for choice in choose(numbers, r.len()):
        
        var s = choice.sorted(cmp[int], SortOrder.Ascending)
        if last != s: 
          last = s
          if s.sum() == target:
            return s.mlt()
      return
    
    



echo "Answer Part 1: ", solve1(input, input.sum() div 3)
echo "Answer Part 2: ", solve1(input, input.sum() div 4)
