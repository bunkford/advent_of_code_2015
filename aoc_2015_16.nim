import tables, strscans, strutils, sequtils

var aunt_sue = {"children": 3,
                "cats": 7,
                "samoyeds": 2,
                "pomeranians": 3,
                "akitas": 0,
                "vizslas": 0,
                "goldfish": 5,
                "trees": 3,
                "cars": 2,
                "perfumes": 1}.toTable

proc solve1(filename: string):int =
  var i = 0
  for line in filename.lines:
    inc(i)
    # Sue 1: goldfish: 6, trees: 9, akitas: 0
    var matches = 0
    var sue = line.split(":")[0].replace("Sue ", "").parseInt
    for item in line.replace("Sue " & $i & ": ", "").split(",").map(proc (x:string):string = x.strip):
      if aunt_sue.hasKey(item.split(": ")[0]) and aunt_sue[item.split(": ")[0]] == item.split(": ")[1].parseInt: inc(matches)
    if matches == 3:
      result = sue
      break

echo "Answer part 1: ", solve1("./aoc_2015_16.txt")