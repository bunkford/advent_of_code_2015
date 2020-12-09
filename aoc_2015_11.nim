import sequtils, strutils , nre

var input = "hxbxwxba"

proc solve(input:string, iteration:int): string =
  var run = 0
  result = input
  while true:
    var pos = result.high
    while true: 
      if result[pos] != 'z':
        inc(result[pos])
        break
      else:
        for i in pos .. result.high:
          result[i] = 'a'
        dec(pos)

    # check if password contains i, o, l
    if 'i' in result or 'o' in result or 'l' in result: continue

    # check if password contain 2 non overlapping pairs
    var found = 0
    pos = 0
    while pos < result.high:
      if result[pos] == result[pos+1]:
        inc(found)
        inc(pos)
      inc(pos)
    if found < 2:
      continue
    
    #check if password contains run
    for i in 0 .. result.high-2:
      if ord(result[i])+1 == ord(result[i+1]) and ord(result[i+1])+1 == ord(result[i+2]):
        inc(run)
        if run == iteration:
          return result



echo "Part 1 answer: ", solve(input, 1) 
echo "Part 2 answer: ", solve(input, 2) 