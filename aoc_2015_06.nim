
import nre, strutils, sequtils

proc input(file:string):seq[string] =
  for line in file.lines:
    result.add(line)

type
  LightArray = array[1..9999, array[1..9999, int]]

var lights:LightArray

proc solve1(input:seq[string]):int = 
  for i in input:
    var line = i.findAll(re"(turn on|turn off|toggle)|([0-9]+)")
    var command = line[0]
    var x1 = line[1].parseInt
    var y1 = line[2].parseInt
    var x2 = line[3].parseInt
    var y2 = line[4].parseInt
    
    for y in y1 .. y2:
      for x in x1 .. x2:
        case command:
          of "turn on":
            lights[x][y] = 1
          of "turn off":
            lights[x][y] = 0
          of "toggle":
            if lights[x][y] == 1:
              lights[x][y] = 0
            else:
              lights[x][y] = 1

  for strand in lights:
    for light in strand:
      if light == 1:
        inc(result)



proc solve2(input:seq[string]):int = 
  for i in input:
    var line = i.findAll(re"(turn on|turn off|toggle)|([0-9]+)")
    var command = line[0]
    var x1 = line[1].parseInt
    var y1 = line[2].parseInt
    var x2 = line[3].parseInt
    var y2 = line[4].parseInt
    
    for y in y1 .. y2:
      for x in x1 .. x2:
        case command:
          of "turn on":
            inc(lights[x][y])
          of "turn off":
            if lights[x][y] > 0:
              dec(lights[x][y])
          of "toggle":
            inc(lights[x][y], 2)

  for strand in lights:
    for light in strand:
      inc(result, light)

    
echo "Part 1 answer: ", solve1(input("./aoc_2015_06.txt"))
echo "Part 2 answer: ", solve2(input("./aoc_2015_06.txt"))
