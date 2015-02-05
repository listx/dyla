#-------card definitions----------
enemycardslvl1 = [
{name: 'Moebius MA squadron', hp: 4, damage: 2, tp: 1, vp: 0, desc: 'mobile armors', img: 'agamemnon.png'},
{name: 'Drake class', hp: 5, damage: 2, tp: 1, vp: 0, desc: 'light escort', img: 'agamemnon.png'},
{name: 'Nelson class', hp: 7, damage: 3, tp: 2, vp: 1, desc: 'heavy escort', img: 'agamemnon.png'},
{name: 'Agamemnon class', hp: 11, damage: 3, tp: 4, vp: 2, desc: 'carrier', img: 'agamemnon.png'}
]

enemycardslvl2 = [
{name: 'GINN squadron', hp: 8, damage: 3, tp: 2, vp: 0, desc: 'mobile suits', img: 'agamemnon.png'},
{name: 'GINN/CGUE squadron', hp: 11, damage: 4, tp: 3, vp: 0, desc: 'elite mobile suits', img: 'agamemnon.png'},
{name: 'Laurasia class', hp: 9, damage: 4, tp: 2, vp: 1, desc: 'assault carrier', img: 'agamemnon.png'},
{name: 'Nazca class', hp: 12, damage: 4, tp: 4, vp: 1, desc: 'fast carrier', img: 'agamemnon.png'}
]

enemycardslvl3 = [
{name: 'Strike Dagger squadron', hp: 14, damage: 3, tp: 2, vp: 0, desc: 'mobile suits', img: 'agamemnon.png'},
{name: 'GUAIZ squadron', hp: 14, damage: 4, tp: 3, vp: 0, desc: 'mobile suits', img: 'agamemnon.png'},
{name: 'Nazca Fleet', hp: 16, damage: 5, tp: 3, vp: 1, desc: 'lots of ships', img: 'agamemnon.png'},
{name: 'Vesalius', hp: 14, damage: 4, tp: 2, vp: 1, desc: 'elite Nazca class', img: 'agamemnon.png'},
{name: 'Dominion', hp: 15, damage: 5, tp: 4, vp: 1, desc: 'new model assault carrier', img: 'agamemnon.png'},
{name: 'Peacemaker Fleet', hp: 20, damage: 9, tp: 6, vp: 2, desc: 'nuclear forces', img: 'agamemnon.png'}
]

attackcards = [
{name: 'Igelstellung 1', cost: 0, damage: 1, desc: 'CIWS point defense', img: 'igelstellung.jpg'},
{name: 'Igelstellung 2', cost: 2, damage: 2, desc: 'upgraded CIWS', img: 'igelstellung.jpg'},
{name: 'Helldart', cost: 4, damage: 3, desc: 'rapid fire short range missiles', img: 'igelstellung.jpg'},
{name: 'Valiant Mk.8', cost: 6, damage: 4, desc: 'linear cannon', img: 'igelstellung.jpg'},
{name: 'Gottfried Mk.71', cost: 8, damage: 5, desc: 'anti-ship laser cannon', img: 'igelstellung.jpg'},
{name: 'Heavy Missile Tubes', cost: 10, damage: 6, desc: 'multipurpose missiles', img: 'igelstellung.jpg'},
{name: 'Lohengrin', cost: 15, damage: 9, desc: 'positron cannon', img: 'igelstellung.jpg'}
]

tacticscards = [
{name: 'Evade', cost: 0, desc: 'damage taken -1', img: 'evade.jpg'},
{name: 'Smoke Dispensers', cost: 2, desc: 'damage taken -2', img: 'evade.jpg'},
{name: 'Antibeam depth charge', cost: 2, desc: 'damage dealt -3, damage taken -3', img: 'evade.jpg'},
{name: 'Emergency repairs', cost: 3, desc: '+1 hp', img: 'evade.jpg'},
{name: 'Scavenge supplies', cost: 3, desc: '+1 tp', img: 'evade.jpg'},
{name: 'Targeting computers', cost: 4, desc: 'damage dealt +1 for each attack card played', img: 'evade.jpg'}
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
      description: cardhash[:desc],
      img: cardhash[:img])
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
    description: cardhash[:desc],
    img: cardhash[:img])
end

tacticscards.each do |cardhash|
  Tacticscard.create(
    name: cardhash[:name],
    cost: cardhash[:cost],
    description: cardhash[:desc],
    img: cardhash[:img])
end
