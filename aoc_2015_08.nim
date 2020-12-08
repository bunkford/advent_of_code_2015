import nre, strutils, json

proc input(file:string):seq[string] =
  for line in file.lines:
    result.add(line)

proc solve1(input:seq[string]):int =
  for line in input:
    inc(result, line.len - line.strip(chars = {'"'}).replace("\\\"", "\"").replace("\\\\", "\\").replace(re"\\x[a-fA-F0-9][a-fA-F0-9]", "@").len)

proc solve2(input:seq[string]):int =
  for line in input:
      inc(result, line.escapeJSON.len - line.len)

echo "Part 1 answer: ", solve1(input("./aoc_2015_08.txt")) 
echo "Part 2 answer: ", solve2(input("./aoc_2015_08.txt")) # 1900 too low