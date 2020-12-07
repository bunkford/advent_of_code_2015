import strutils

echo "Part 1 answer: ", "./aoc_2015_01.txt".readFile.count("(") -  "./aoc_2015_01.txt".readFile.count(")")

var floor = 0
var pos = 0
for c in "./aoc_2015_01.txt".readFile:
  if c == '(':
    inc(floor)
  elif c == ')':
    dec(floor)
  inc(pos)
  echo floor
  if floor < 0:
    break
echo "Part 2 answer: ", pos
