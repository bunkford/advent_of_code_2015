import strutils, sequtils

var total:int
var total_ribbon:int
for line in "./aoc_2015_02.txt".lines:
  # parse dims

  var dim = line.split("x")
  var l = dim[0].parseInt
  var w = dim[1].parseInt
  var h = dim[2].parseInt
  

  # ribbon
  
  var dims = @[l,w,h]
  delete(dims, maxIndex(dims)) # remove largest dim
  for d in dims:
    inc(total_ribbon, d+d)
  
  # bow
  
  inc(total_ribbon, l*w*h)


  # paper

  var side1 = 2*l*w
  var side2 = 2*w*h
  var side3 = 2*h*l
  var extra = min(@[side1, side2, side3]) div 2
  
  inc(total, side1+side2+side3+extra) 

echo "Part 1 answer: ", total
echo "Part 2 answer: ", total_ribbon