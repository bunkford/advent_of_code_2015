import tables, strutils 

type
  Gate = ref object
    hasValue: bool
    value: uint16
    instruction: string

proc solve1(filename: string, bvalue:uint16):uint16 =
  var gates = initTable[string, Gate]()

  for line in lines filename:
    let sides = line.split(" -> ")
    gates[sides[1]] = Gate(instruction: sides[0])

  gates["b"].value = bvalue # 956 # 14146
  gates["b"].hasValue = true

  proc getSignal(gateId: string): uint16  =
    if not gates.hasKey(gateId):
      return uint16(gateId.parseInt())

    let gate = gates[gateId]

    if gate.hasValue:
      return gate.value

    let tokens = gate.instruction.split(' ')
    if tokens.len == 1:
      result = getSignal(tokens[0])
    elif tokens.len == 2:
      result = not getSignal(tokens[1])
    else:
      let operator = tokens[1]
      case operator:
        of "AND":
          result = getSignal(tokens[0]) and getSignal(tokens[2])
        of "OR":
          result = getSignal(tokens[0]) or getSignal(tokens[2])
        of "LSHIFT":
          result = getSignal(tokens[0]) shl getSignal(tokens[2])
        of "RSHIFT":
          result = getSignal(tokens[0]) shr getSignal(tokens[2])
        else: discard
    gate.value = result
    gate.hasValue = true
  return getSignal("a")


echo "Part 1 answer: ", solve1("./aoc_2015_07.txt", 14146)
echo "Part 2 answer: ", solve1("./aoc_2015_07.txt", solve1("./aoc_2015_07.txt", 14146))
