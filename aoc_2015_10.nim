import nre, strutils
var input:string = "1321131112"


proc solve1(input:string):int =
  var code, last_code:string = input
  for x in 1..40:
    echo "running iteration: ", x
    code = last_code
    last_code = ""
    for i in code.findAll(re"([0-9])\1*"):
      var len = i.len
      var num = i[0]
      last_code = last_code & $len & $num
  return last_code.len


proc solve2(input:string):int =
  var code, last_code:string = input
  for x in 1..50:
    echo "running iteration: ", x
    code = last_code
    last_code = ""
    for i in code.findAll(re"([0-9])\1*"):
      var len = i.len
      var num = i[0]
      last_code = last_code & $len & $num
  return last_code.len

proc solve2RegexReplaceTest(input:string):int =
  var inp:string = input
  for i in 1..50:
    inp = nre.replace(inp, re"([0-9])\1*", proc(s:string):string = return $s.len & $s[0])
    echo i, " len: ", inp.len
  return inp.len

proc solvefaster(input:string):(int, string) =
  var previous:char
  var current = input[0]
  var count = 0
  var final = ""
  for ch in input:
    if ch != current:
      previous = current
      current = ch
      final.add($count & $previous)
      count = 0
    inc(count)
  final.add($count & $current)
  return (final.len, final)

#echo "Answer part 1: ", solve1(input) # slow
#echo "Answer part 2: ", solve2(input) # super slow
#echo "Answer part 2 (nre.replace test): ", solve2RegexReplaceTest(input) # even slower

var final = input
var n:int
for i in 1..50:
  (n, final) = solvefaster(final)
  echo "Iteration: ", i , ": ", n


