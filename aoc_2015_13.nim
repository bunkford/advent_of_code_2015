import strutils, tables, algorithm

proc input(file:string):seq[string] =
  for line in file.lines:
    result.add(line)

proc solve1(input:seq[string]): int =
  var table = initTable[(string,string), int]()
  var people:seq[string] # all the people at the party
  for i in input:
    var inp = i.split(" ")
    var name = inp[0]
    var dir = inp[2]
    var amt = inp[3].parseInt
    if dir == "lose": amt = -amt
    var to = inp[^1][0..^2]
    table[(name, to)] = amt
    if name notin people: people.add(name)
    
  while nextPermutation(people):
    # clowns to the left, jokers to the right
    var tmp:int
    for middle in 0..people.high:
      var clown = (middle + people.high) mod people.len # clown
      var joker = (middle + 1) mod people.len # joker
      inc(tmp, table[(people[middle], people[clown])])
      inc(tmp, table[(people[middle], people[joker])])
    if tmp > result:
      result = tmp

proc solve2(input:seq[string]): int =
  var table = initTable[(string,string), int]()
  var people:seq[string] # all the people at the party
  for i in input:
    var inp = i.split(" ")
    var name = inp[0]
    var dir = inp[2]
    var amt = inp[3].parseInt
    if dir == "lose": amt = -amt
    var to = inp[^1][0..^2]
    table[(name, to)] = amt
    if name notin people: people.add(name)

  # add myself
  for i in people:
    table[("Duncan", i)] = 0  
    table[(i, "Duncan")] = 0
  people.add("Duncan")

  while nextPermutation(people):
    # clowns to the left, jokers to the right
    var tmp:int
    for middle in 0..people.high:
      var clown = (middle + people.high) mod people.len # clown
      var joker = (middle + 1) mod people.len # joker
      inc(tmp, table[(people[middle], people[clown])])
      inc(tmp, table[(people[middle], people[joker])])
    if tmp > result:
      result = tmp


echo "Part 1 answer: ", solve1(input("./aoc_2015_13.txt"))
echo "Part 2 answer: ", solve2(input("./aoc_2015_13.txt"))
