import strscans, algorithm, tables, sequtils

proc input(file:string):seq[string] =
  for line in file.lines:
    result.add(line)

proc solve1(input:seq[string]):int =
  var table = initTable[(string, string), int]()
  var locations:seq[string]
  
  var fr, to: string
  var dist: int
  for line in input:
    discard scanf(line, "$w to $w = $i", fr, to, dist)
    
    # add all locations to seq
    if fr notin locations: locations.add(fr)
    if to notin locations: locations.add(to)

    # add all possible combinations to table
    table[(fr, to)] = dist
    table[(to, fr)] = dist

  sort(locations, cmp) 

  var distances:seq[int]
  while nextPermutation locations:
    var sum = 0
    for i in 0 ..< locations.high:
      inc(sum, table[(locations[i], locations[i+1])])

    distances.add(sum)
  
  return distances.min

proc solve2(input:seq[string]):int =
  var table = initTable[(string, string), int]()
  var locations:seq[string]
  
  var fr, to: string
  var dist: int
  for line in input:
    discard scanf(line, "$w to $w = $i", fr, to, dist)
    
    # add all locations to seq
    if fr notin locations: locations.add(fr)
    if to notin locations: locations.add(to)

    # add all possible combinations to table
    table[(fr, to)] = dist
    table[(to, fr)] = dist

  sort(locations, cmp) 

  var distances:seq[int]
  while nextPermutation locations:
    var sum = 0
    for i in 0 ..< locations.high:
      inc(sum, table[(locations[i], locations[i+1])])

    distances.add(sum)
  
  return distances.max

echo "Part 1 answer: ", solve1(input("./aoc_2015_09.txt")) 
echo "Part 2 answer: ", solve2(input("./aoc_2015_09.txt"))