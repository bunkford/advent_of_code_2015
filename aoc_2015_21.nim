

type 
  Player = object
    hp: int
    damage: int
    armour: int
  
  Stats = object
    cost: int
    damage: int
    armour: int

const opponent = Player(hp: 100, damage: 8, armour: 2)

var weapons:seq[Stats]
var armour:seq[Stats]
var rings:seq[Stats]

#Weapons:    Cost  Damage  Armor
weapons.add(Stats(cost:8, damage:4, armour:0))
weapons.add(Stats(cost:10, damage:5, armour:0))
weapons.add(Stats(cost:25, damage:6, armour:0))
weapons.add(Stats(cost:40, damage:7, armour:0))
weapons.add(Stats(cost:74, damage:8, armour:0))

#Armor:      Cost  Damage  Armor
armour.add(Stats(cost:0, damage:0, armour:0)) # can hold armour in one hand, or none at all
armour.add(Stats(cost:13, damage:0, armour:1))
armour.add(Stats(cost:31, damage:0, armour:2))
armour.add(Stats(cost:53, damage:0, armour:3))
armour.add(Stats(cost:75, damage:0, armour:4))
armour.add(Stats(cost:102, damage:0, armour:5))

#Rings:      Cost  Damage  Armor
rings.add(Stats(cost:0, damage:0, armour:0)) # can wear ring on one hand, or none at all
rings.add(Stats(cost:0, damage:0, armour:0)) # can hold ring on one hand, or none at all
rings.add(Stats(cost:25, damage:1, armour:0))
rings.add(Stats(cost:50, damage:2, armour:0))
rings.add(Stats(cost:100, damage:3, armour:0))
rings.add(Stats(cost:20, damage:0, armour:1))
rings.add(Stats(cost:40, damage:0, armour:2))
rings.add(Stats(cost:80, damage:0, armour:3))

func attack(w, a, r1, r2: Stats): Stats =
  let cost = w.cost + a.cost + r1.cost + r2.cost
  let damage = w.damage + a.damage + r1.damage + r2.damage
  let armour = w.armour + a.armour + r1.armour + r2.armour
  return Stats(cost:cost, damage: damage, armour: armour)

var part1:int = int.high
var part2:int = 0

for w in weapons:
  for a in armour:
    for i, r1 in rings:
      for r2 in rings[i+1 .. rings.high]:
        let score = attack(w, a, r1, r2)
        if max(score.damage - opponent.armour, 1) >= max(opponent.damage - score.armour, 1):
          if score.cost < part1:
              part1 = score.cost
          elif score.cost > part2:
            part2 = score.cost

echo "Answer part 1: ", part1
echo "Answer part 2: ", part2
