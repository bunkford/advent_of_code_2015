import strscans, strutils
type
    Ingredient = object
      name: string
      capacity:int 
      durability:int
      flavor:int
      texture:int
      calories:int


proc input(filename: string):seq[Ingredient] = 
  for line in filename.lines:

    var name:string
    var capacity, durability, flavor, texture, calories:int
    if scanf(line, "$w: capacity $i, durability $i, flavor $i, texture $i, calories $i", name, capacity, durability, flavor, texture, calories):
      result.add(Ingredient(name: name, capacity: capacity, durability: durability, flavor: flavor, texture: texture, calories: calories))

proc solve1(input:seq[Ingredient]):int64 = 
  for a in 1 .. 97: # ingredient 1
    for b in 1 .. 97 - a: # ingredient 2
      for c in 1 .. 97 - a - b: # ingredient 3 
        block batch:
          let d =  100 - a - b - c # ingredient 4
          var total: BiggestInt = 1
          # need to compare each ingredient of type together

          var cap_score = (a * input[0].capacity) + (b * input[1].capacity) + (c * input[2].capacity) + (d * input[3].capacity)
          var dur_score = (a * input[0].durability) + (b * input[1].durability) + (c * input[2].durability) + (d * input[3].durability)
          var fla_score = (a * input[0].flavor) + (b * input[1].flavor) + (c * input[2].flavor) + (d * input[3].flavor)
          var tex_score = (a * input[0].texture) + (b * input[1].texture) + (c * input[2].texture) + (d * input[3].texture)

          if cap_score <= 0 or dur_score <= 0 or fla_score <= 0 or tex_score <= 0: break batch
          
          total = cap_score * dur_score * fla_score * tex_score

          if total > result: result = total

proc solve2(input:seq[Ingredient]):int64 = 
  for a in 1 .. 97: # ingredient 1
    for b in 1 .. 97 - a: # ingredient 2
      for c in 1 .. 97 - a - b: # ingredient 3 
        block batch:
          let d =  100 - a - b - c # ingredient 4
          var total: BiggestInt = 1
          # need to compare each ingredient of type together

          var cap_score = (a * input[0].capacity) + (b * input[1].capacity) + (c * input[2].capacity) + (d * input[3].capacity)
          var dur_score = (a * input[0].durability) + (b * input[1].durability) + (c * input[2].durability) + (d * input[3].durability)
          var fla_score = (a * input[0].flavor) + (b * input[1].flavor) + (c * input[2].flavor) + (d * input[3].flavor)
          var tex_score = (a * input[0].texture) + (b * input[1].texture) + (c * input[2].texture) + (d * input[3].texture)
          var cal_score = (a * input[0].calories) + (b * input[1].calories) + (c * input[2].calories) + (d * input[3].calories)

          if cap_score <= 0 or dur_score <= 0 or fla_score <= 0 or tex_score <= 0 or cal_score != 500: break batch
          
          total = cap_score * dur_score * fla_score * tex_score

          if total > result: result = total

echo "Answer part 1: ", solve1(input("./aoc_2015_15.txt")) 
echo "Answer part 2: ", solve2(input("./aoc_2015_15.txt")) 
