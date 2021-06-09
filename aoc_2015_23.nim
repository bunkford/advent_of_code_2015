import strutils

proc input(file: string): seq[tuple[instruction: string, register, jump: int]] =
  for line in file.lines:
    let
      commands = line.split()
      instruction = commands[0]
      register = ord(commands[1][0]) - ord('a')
      jump = if instruction.startsWith('j'): commands[^1].parseInt-1 else: 0
    result.add((instruction, register, jump))

proc solve(commands: seq[tuple[instruction: string, register, jump: int]], reg_a_initial:int = 0):int =
  var i: int
  var registeristers:array[2, int] = [reg_a_initial, 0];

  while i < len(commands):
    let (instruction, register, jump) = commands[i]
    
    case instruction
      of "hlf": registeristers[register] = registeristers[register] div 2 # half current value
      of "tpl": registeristers[register] = 3 * registeristers[register] # tripple current value
      of "inc": inc registeristers[register] # increment by 1
      of "jmp": i += jump # jump to instruction using offset to self
      of "jie": # same as jmp, but only if register is even number
        if registeristers[register] mod 2 == 0:
          i += jump
      of "jio": # same as jmp, but only if register is equal to one
        if registeristers[register] == 1:
          i += jump
     
    inc i
  
  # return registerister b
  return registeristers[1]

      
echo "Answer Part 1: ", solve(input("aoc_2015_23.txt"));
echo "Answer Part 2: ", solve(input("aoc_2015_23.txt"), 1);