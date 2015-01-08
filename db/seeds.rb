#To add new Enemy, Attack, or Tactics cards, add the entry at the end of each corresponding array for the card type.

ECardName = ['Drake class', 'Nelson class', 'Agamemnon class']
ECardDamage = [2,3,3]
ECardHp = [5,7,11]
ECardVp = [0,1,2]
ECardTp = [1,2,4]
ECardDesc = ['light escort','heavy escort','carrier']

ACardName = ['Igelstellung','Valiant','Lohengrin']
ACardCost = [0,6,15]
ACardDamage = [1,4,9]
ACardDesc = ['CIWS', 'linear cannon', 'positron cannon']

TCardName = ['Smoke dispensers','Antibeam depth charge','Emergency repairs']
TCardCost = [2,2,3]
TCardDesc = ['-2 to damage taken this turn','-3 to damage dealt and taken this turn','regain 1 hp']

ECardName.length.times do |cardnum|
  Enemycard.create(name: ECardName[cardnum], damage: ECardDamage[cardnum], hp: ECardHp[cardnum], vp: ECardVp[cardnum], tp: ECardTp[cardnum], description: ECardDesc[cardnum])
end

ACardName.length.times do |cardnum|
  Attackcard.create(name: ACardName[cardnum], cost: ACardCost[cardnum], damage: ACardDamage[cardnum],description: ACardDesc[cardnum])
end

TCardName.length.times do |cardnum|
  Tacticscard.create(name: TCardName[cardnum], cost: TCardCost[cardnum], description: TCardDesc[cardnum])
end

# redo format for seeds. 3 arrays of hashes for each card type, like this:
# enemycardshashesarray = [
# {name: 'aefawa', damage: 5, vp: 2, etc...},
# {card2 hash},
# {card3 hash}
# ]

# enemycardshashesarray.each do |hash|
#   Enemycard.create(
#     name: hash['name'],
#     damage: hash['damage'], etc...
#     )
# end