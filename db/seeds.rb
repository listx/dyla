#-------card definitions----------
enemycardslvl1 = [
{name: 'Moebius MA squadron', hp: 4, damage: 2, tp: 1, vp: 0, desc: 'mobile armors'},
{name: 'Drake class', hp: 5, damage: 2, tp: 1, vp: 0, desc: 'light escort'},
{name: 'Nelson class', hp: 7, damage: 3, tp: 2, vp: 1, desc: 'heavy escort'},
{name: 'Agamemnon class', hp: 11, damage: 3, tp: 4, vp: 2, desc: 'carrier'}
]

enemycardslvl2 = [
{name: 'GINN squadron', hp: 8, damage: 3, tp: 2, vp: 0, desc: 'mobile suits'},
{name: 'GINN/CGUE squadron', hp: 11, damage: 4, tp: 3, vp: 0, desc: 'elite mobile suits'},
{name: 'Laurasia class', hp: 9, damage: 4, tp: 2, vp: 1, desc: 'assault carrier'},
{name: 'Nazca class', hp: 12, damage: 4, tp: 4, vp: 1, desc: 'fast carrier'}
]

enemycardslvl3 = [
{name: 'Strike Dagger squadron', hp: 14, damage: 3, tp: 2, vp: 0, desc: 'mobile suits'},
{name: 'GUAIZ squadron', hp: 14, damage: 4, tp: 3, vp: 0, desc: 'mobile suits'},
{name: 'Nazca Fleet', hp: 16, damage: 5, tp: 3, vp: 1, desc: 'lots of ships'},
{name: 'Vesalius', hp: 14, damage: 4, tp: 2, vp: 1, desc: 'elite Nazca class'},
{name: 'Dominion', hp: 15, damage: 5, tp: 4, vp: 1, desc: 'new model assault carrier'},
{name: 'Peacemaker Fleet', hp: 20, damage: 9, tp: 6, vp: 2, desc: 'nuclear forces'}
]

attackcards = [
{name: 'Igelstellung 1', cost: 0, damage: 1, desc: 'CIWS point defense'},
{name: 'Igelstellung 2', cost: 2, damage: 2, desc: 'upgraded CIWS'},
{name: 'Helldart', cost: 4, damage: 3, desc: 'rapid fire short range missiles'},
{name: 'Valiant Mk.8', cost: 6, damage: 4, desc: 'linear cannon'},
{name: 'Gottfried Mk.71', cost: 8, damage: 5, desc: 'anti-ship laser cannon'},
{name: 'Heavy Missile Tubes', cost: 10, damage: 6, desc: 'multipurpose missiles'},
{name: 'Lohengrin', cost: 15, damage: 9, desc: 'positron cannon'}
]

tacticscards = [
{name: 'Evade', cost: 0, desc: 'damage taken -1'},
{name: 'Smoke Dispensers', cost: 2, desc: 'damage taken -2'},
{name: 'Antibeam depth charge', cost: 2, desc: 'damage dealt -3, damage taken -3'},
{name: 'Emergency repairs', cost: 3, desc: '+1 hp'},
{name: 'Scavenge supplies', cost: 3, desc: '+1 tp'},
{name: 'Targeting computers', cost: 4, desc: 'damage dealt +1 for each attack card played'}
]

#-------end card definitions------

def genEnemies(cards_arr, level)
  cards_arr.each do |cardhash|
    Enemycard.create(
      lvl: level,
      name: cardhash[:name],
      hp: cardhash[:hp],
      damage: cardhash[:damage],
      tp: cardhash[:tp],
      vp: cardhash[:vp],
      description: cardhash[:desc])
  end
end

genEnemies(enemycardslvl1, 1)
genEnemies(enemycardslvl2, 2)
genEnemies(enemycardslvl3, 3)

attackcards.each do |cardhash|
  Attackcard.create(
    name: cardhash[:name],
    cost: cardhash[:cost],
    damage: cardhash[:damage],
    description: cardhash[:desc])
end

tacticscards.each do |cardhash|
  Tacticscard.create(
    name: cardhash[:name],
    cost: cardhash[:cost],
    description: cardhash[:desc])
end
