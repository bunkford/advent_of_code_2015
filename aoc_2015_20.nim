var input = 36000000

proc solve1(input:int):int = 
  var d = input div 10
  var counts = newSeq[int](d)
  for i in 1..d:
    for j in 1..min(d div i, int.high):
      counts[j*i-1] += i * 10
    if counts[i-1] >= input:
      return i

proc solve2(input:int):int =
  var d = input div 11
  var counts = newSeq[int](d)
  for i in 1..d:
    for j in 1..min(d div i, 50):
      counts[j*i-1] += i * 11
    if counts[i-1] >= input:
      return i


echo "Answer part 1: ", solve1(input)
echo "Answer part 2: ", solve2(input)