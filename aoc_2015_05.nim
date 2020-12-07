import sequtils,nre

proc input(file:string):seq[string] =
  var r:seq[string]
  for line in file.lines:
    r.add(line)
  return r

proc part1(input:seq[string]):int =
  
  var r:int
  for line in input:
    
    # rule 1
    if line.findAll(re"(a|e|i|o|u)").len < 3:
      continue

    # rule 2
    var good:bool = false
    var cur:char
    for c in line:
      if c == cur:
        good = true
      cur = c
    if good == false:
      continue

    # rule 3
    if line.findAll(re"(ab|cd|pq|xy)").len != 0:
      continue
      
    inc(r)
  return r

proc part2(input:seq[string]):int =
  var r:int
  for line in input:
     var rule1 = line.findAll(re"(\w\w).*\1").len
     var rule2 = line.findAll(re"(\w).\1").len
     if rule1 > 0 and rule2 > 0:
       inc(result)


echo "Answer part 1: ", part1(input("./aoc_2015_05.txt"))
echo "Answer part 2: ", part2(input("./aoc_2015_05.txt"))