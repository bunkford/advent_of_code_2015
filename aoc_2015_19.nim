import algorithm, itertools, strutils, sequtils, json

# Test
# var molecules = @[("H", "HO"), ("H", "OH"), ("O", "HH")]
# var medicine = "HOHOHO"

var molecules = @[("Al", "ThF"), ("Al", "ThRnFAr"), ("B", "BCa"), ("B", "TiB"), ("B", "TiRnFAr"), ("Ca", "CaCa"), ("Ca", "PB"), ("Ca", "PRnFAr"), ("Ca", "SiRnFYFAr"), ("Ca", "SiRnMgAr"), ("Ca", "SiTh"), ("F", "CaF"), ("F", "PMg"), ("F", "SiAl"), ("H", "CRnAlAr"), ("H", "CRnFYFYFAr"), ("H", "CRnFYMgAr"), ("H", "CRnMgYFAr"), ("H", "HCa"), ("H", "NRnFYFAr"), ("H", "NRnMgAr"), ("H", "NTh"), ("H", "OB"), ("H", "ORnFAr"), ("Mg", "BF"), ("Mg", "TiMg"), ("N", "CRnFAr"), ("N", "HSi"), ("O", "CRnFYFAr"), ("O", "CRnMgAr"), ("O", "HP"), ("O", "NRnFAr"), ("O", "OTi"), ("P", "CaP"), ("P", "PTi"), ("P", "SiRnFAr"), ("Si", "CaSi"), ("Th", "ThCa"), ("Ti", "BP"), ("Ti", "TiTi"), ("e", "HF"), ("e", "NAl"), ("e", "OMg")]
var medicine = "CRnCaSiRnBSiRnFArTiBPTiTiBFArPBCaSiThSiRnTiBPBPMgArCaSiRnTiMgArCaSiThCaSiRnFArRnSiRnFArTiTiBFArCaCaSiRnSiThCaCaSiRnMgArFYSiRnFYCaFArSiThCaSiThPBPTiMgArCaPRnSiAlArPBCaCaSiRnFYSiThCaRnFArArCaCaSiRnPBSiRnFArMgYCaCaCaCaSiThCaCaSiAlArCaCaSiRnPBSiAlArBCaCaCaCaSiThCaPBSiThPBPBCaSiRnFYFArSiThCaSiRnFArBCaCaSiRnFYFArSiThCaPBSiThCaSiRnPMgArRnFArPTiBCaPRnFArCaCaCaCaSiRnCaCaSiRnFYFArFArBCaSiThFArThSiThSiRnTiRnPMgArFArCaSiThCaPBCaSiRnBFArCaCaPRnCaCaPMgArSiRnFYFArCaSiThRnPBPMgAr"

proc solve1(molecules:seq[(string, string)], medicine: string): int =
  var combinations: seq[string]
  for m in molecules:
    var last = 0
    while true:
      last = medicine.find(m[0], last)
      if last == - 1: break
      var sub = medicine
      sub[last .. last + m[0].len - 1] = m[1]
      combinations.add(sub)
      inc(last)

  return combinations.deduplicate().len



proc solve2(medicine: string): int =
  # https://www.reddit.com/r/adventofcode/comments/3xflz8/day_19_solutions/cy4etju/
  var n: int
  for c in medicine:
    if c.isUpperAscii: inc n
  let numOfRn = medicine.count("Rn")
  let numOfY = medicine.count('Y')

  return(n - 2*numOfRn - 2*numOfY - 1)

echo "Answer Part 1: ", solve1(molecules, medicine)
echo "Answer Part 2: ", solve2(medicine)




