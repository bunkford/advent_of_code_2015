import md5

var secret = "./aoc_2015_04.txt".readFile


proc part1(secret:string):int =
  var i: int
  while true:
    var hash = $(secret & $i).toMD5
    if hash[0..4] == "00000":
        return i
    inc(i)

proc part2(secret:string):int =
  var i: int
  while true:
    var hash = $(secret & $i).toMD5
    if hash[0..5] == "000000":
        return i
    inc(i)

echo "Part 1 answer: ", part1(secret)
echo "Part 2 answer: ", part2(secret)