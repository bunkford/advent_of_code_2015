import tables

proc part1(file:string):int = 
  var houses = initTable[string, int]()
  houses["0,0"]=1

  var x, y = 0
  for d in file.readFile:
    case d:
      of '>':
        inc(x)
      of 'v':
        inc(y)
      of '<':
        dec(x)
      of '^':
        dec(y)
      else:
        discard

    houses[$x & "," & $y] =  houses.getOrDefault($x & "," & $y) + 1

  var multi_visits: int
  for k, house in houses:
    if house >= 1: # visited at least once
      inc(multi_visits)

  return multi_visits

proc part2(file:string):int = 
  var houses = initTable[string, int]()
  houses["0,0"]=2

  var sx, sy, rx, ry, z = 0
  for d in file.readFile:
    if z == 0:
      case d:
        of '>':
          inc(sx)
        of 'v':
          inc(sy)
        of '<':
          dec(sx)
        of '^':
          dec(sy)
        else:
          discard

      houses[$sx & "," & $sy] =  houses.getOrDefault($sx & "," & $sy) + 1
      z = 1

    else:
      case d:
        of '>':
          inc(rx)
        of 'v':
          inc(ry)
        of '<':
          dec(rx)
        of '^':
          dec(ry)
        else:
          discard

      houses[$rx & "," & $ry] =  houses.getOrDefault($rx & "," & $ry) + 1
      z = 0


  var multi_visits: int
  for k, house in houses:
    if house >= 1: # visited at least once
      inc(multi_visits)

  return multi_visits

echo "Part 1 answer: ", part1("./aoc_2015_03.txt")

echo "Part 2 answer: ", part2("./aoc_2015_03.txt")
