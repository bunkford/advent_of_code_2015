import json, nre, sequtils, strutils


proc solve1(filename: string): int =
  var j = parseFile(filename)
  result = 0
  var i = 0
  proc f(x: JsonNode): int =
    case x.kind
    of JArray:
      for y in x:
        result += f(y)
    of JObject:
      for y,z in x:
        result += f(z)
    of JInt:
      result += x.num.int
    else:
      discard

  result = f(j)

proc solve2(filename:string): int =
  var j = parseFile(filename)
  result = 0
  var i = 0
  proc f(x: JsonNode): int =
    case x.kind
    of JArray:
      for y in x:
        result += f(y)
    of JObject:
      for y,z in x:
        if z.kind == JString and z.getStr == "red":
          return
      for y,z in x:
        result += f(z)
    of JInt:
      result = x.num.int
    else:
      discard

  result = f(j)

echo "Part 1 answer: ", solve1("./aoc_2015_12.txt")
echo "Part 2 answer: ", solve2("./aoc_2015_12.txt")