import sequtils, tables

var input = @[50,44,11,49,42,46,18,32,26,40,21,7,18,43,10,47,36,24,22,40]
var test = @[20, 15, 10, 5, 5]


iterator combinations*(n, r: Positive): seq[int] =
  ## Iterator which yields combinations of size ``r`` of a range ``0 ..< n``.
  ##
  ## Both arguments must be positive numbers.
  var
    x = newSeq[int](r)
    stack = @[0]

  while stack.len > 0:
    var
      i = stack.high
      v = stack.pop()
    while v < n:
      x[i] = v
      inc v
      inc i
      stack.add(v)
      if i == r:
        yield x
        break

iterator combinations*[T](s: openArray[T], r: Positive): seq[T] =
  ## Iterator which yields combinations of ``s`` of length ``r``.
  ##
  ## Length ``r`` must be a positive number.
  var x = newSeq[T](r)
  for indComb in combinations(s.len, r):
    for i in 0 ..< r:
      x[i] = s[indComb[i]]
    yield x

proc solve1(input: seq[int]): int =
  for i in 1..input.high:
    for y in combinations(input, i):
      if y.foldl(a + b) == 150:
        inc(result)

proc solve2(input: seq[int]): int =
  var count = initCountTable[int]()
  for i in 1..input.high:
    for y in combinations(input, i):
      if y.foldl(a + b) == 150:
        count.inc(y.len)

  var lowest_container_count: int
  for k, v in count:
    if lowest_container_count == 0: 
      lowest_container_count = k 
    elif k < lowest_container_count: 
      lowest_container_count = k
  
  return count[lowest_container_count]


echo "Answer part 1: ", solve1(input) 
echo "Answer part 2: ", solve2(input) 