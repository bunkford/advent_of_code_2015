# To continue, please consult the code grid in the manual.  Enter the code at row 2981, column 3075.

import math 

proc powmod(base, exponent, modulo: BiggestInt): BiggestInt =
  var e = exponent
  var b = base
  result = 1
  while e > 0:
    if e mod 2 == 1:
      result = (result * b) mod modulo
    e = e div 2
    b = (b ^ 2) mod modulo

proc solve1(row: int, col:int):BiggestInt =
  return powmod(252533, (row + col - 2) * (row + col - 1) div 2 + col - 1, 33554393) * 20151125 mod 33554393

echo "Answer Part 1: ", solve1(2981, 3075)
