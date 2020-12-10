import strscans, strutils, tables, osproc


proc solve(): int =
  var table = initTable[(string, string), int]()
  var map = initTable[string, string]()
  var reindeers:seq[string]
  for line in "./aoc_2015_14.txt".lines:
    var reindeer: string
    var speed, duration, rest: int
    if scanf(line, "$w can fly $i km/s for $i seconds, but then must rest for $i seconds.", reindeer, speed, duration, rest):
      reindeers.add(reindeer)
      table[(reindeer, "speed")] = speed
      table[(reindeer, "duration")] = duration
      table[(reindeer, "rest")] = rest

      table[(reindeer, "points")] = 0 # seconds flying
      table[(reindeer, "distance")] = 0 # distance traveled

      table[(reindeer, "stopped")] = 0 # seconds stopped
      table[(reindeer, "flying")] = 0 # seconds flying


  for s in 1 .. 2503:
    for deer in reindeers:
      if table[(deer, "flying")] < table[(deer, "duration")] and table[(deer, "stopped")] == 0: # flying, duration hasn't been met and not stopped
        table[(deer, "distance")] += table[(deer, "speed")]
        table[(deer, "flying")] += 1
        map[deer] = repeat(' ', table[(deer, "distance")] div 50) & "🦌" 

      elif table[(deer, "flying")] == table[(deer, "duration")]: # flying is greater than duration, this is a stopped second, reset flying
        table[(deer, "flying")] = 0
        table[(deer, "stopped")] += 1
        map[deer] = repeat(' ', table[(deer, "distance")] div 50) & "🦌"

      elif table[(deer, "stopped")] > 0 and table[(deer, "stopped")] < table[(deer, "rest")]: # this is a stopped second
        table[(deer, "stopped")] += 1 
        map[deer] = repeat(' ', table[(deer, "distance")] div 50) & "🦌" 

      elif table[(deer, "stopped")] == table[(deer, "rest")]: # this is a flying second, reset stop
        table[(deer, "stopped")] = 0
        table[(deer, "flying")] += 1
        table[(deer, "distance")] += table[(deer, "speed")]
        map[deer] = repeat(' ', table[(deer, "distance")] div 50) & "🦌"

    var dp:seq[int]
    for k, v in table:
      if k[1] == "distance":
        dp.add(v)
    for k, v in table:
      if k[1] == "distance":
        if v == dp.max: 
          table[(k[0], "points")] += 1

    discard execCmd "clear"
    echo alignLeft("Name", 8) & alignLeft("Pts.", 5) & alignLeft("Dist.", 8)
    for k, v in map:
      echo alignLeft(k, 8) & alignLeft($table[(k, "points")], 5) & alignLeft($table[(k, "distance")] & " Km", 7) & "|" & alignLeft(v, 56) & "|"
  var distance_winner, points_winner:string
  var points:int 
  for k, v in table:
    if k[1] == "distance":
      if v > result: 
        result = v
        distance_winner = k[0]
    if k[1] == "points":
      if v > points:
        points = v
        points_winner = k[0]
  echo "Distance Winner: ", distance_winner , " @ ", result, " Km"
  echo "Points Winner: ", points_winner , " @ ", points 
    
discard solve()
     
