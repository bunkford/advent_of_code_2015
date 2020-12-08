import nre, strutils

proc input(file:string):seq[string] =
  for line in file.lines:
    result.add(line)

proc solve1(input:seq[string]): int =
  for line in input:
    var line_len = line.len
    inc(result, line.len - line.strip(chars = {'"'}).replace("\\\"", "\"").replace("\\\\", "\\").replace(re"\\x[a-fA-F0-9][a-fA-F0-9]", "@").len)

echo "Part 1 answer: ", solve1(input("./aoc_2015_08.txt")) 