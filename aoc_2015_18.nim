import sequtils, strutils, tables

proc input(file: string): seq[string] =
  for line in file.lines:
    result.add(line)


proc get_neigbours(input:seq[string], col:int, row:int):seq[string] =
  var directions = {"N": (0, -1), "S": (0, 1), "E": (-1, 0), "W": (1, 0), "NE": (-1, 1), "SE": (1, 1), "SW": (-1, -1), "NW": (1, -1)}.toTable
  for dir, coords in directions:
    var x = col + coords[0]
    var y = row + coords[1]
    while  x >= 0 and x <= input.high and y >= 0 and y <= input[row].high:
      # return direct neighbours
      result.add($input[x][y])
      break

proc solve1(input:seq[string]):int = 
  var current_input, next_input = input

  for i in 1 .. 100:
    for x in 0..current_input.high:
      for y in 0..current_input[x].high:
        var light = current_input[x][y]
        var neighbours = get_neigbours(current_input, x, y)

        if light == '#' and neighbours.count("#") in [2, 3]: next_input[x][y] = '#' else: next_input[x][y] = '.' # on, stays on
        if light == '.' and neighbours.count("#") == 3: next_input[x][y] = '#'

    #echo "\n"
    #for l in current_input:
    #  echo l

    current_input = next_input

  return current_input.join.count("#")

proc solve2(input:seq[string]):int = 
  var current_input, next_input = input
  current_input[0][0] = '#'
  current_input[0][^1] = '#'
  current_input[^1][0] = '#'
  current_input[^1][^1] = '#'
  for i in 1 .. 100:
    for x in 0..current_input.high:
      for y in 0..current_input[x].high:
        var light = current_input[x][y]
        var neighbours = get_neigbours(current_input, x, y)

        if light == '#' and neighbours.count("#") in [2, 3]: next_input[x][y] = '#' else: next_input[x][y] = '.' # on, stays on
        if light == '.' and neighbours.count("#") == 3: next_input[x][y] = '#'

    #echo "\n"
    #for l in current_input:
    #  echo l

    current_input = next_input
    current_input[0][0] = '#'
    current_input[0][^1] = '#'
    current_input[^1][0] = '#'
    current_input[^1][^1] = '#'

  return current_input.join.count("#")

  
echo "Part 1 answer: ", solve1(input("./aoc_2015_18.txt")) #4905 too high
echo "Part 2 answer: ", solve2(input("./aoc_2015_18.txt")) #4905 too high