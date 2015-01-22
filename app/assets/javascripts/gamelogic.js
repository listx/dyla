$(document).ready(function() {
  $('#enemypicture').on('click', playerSetup);
  $('#enemypicture').on('click', enemySetup);

  var enemycards1list = $.parseJSON($('#ec1').attr('datastuff'))
  console.log(enemycards1list);
  var enemycards2list = $.parseJSON($('#ec2').attr('datastuff'))
  var enemycards3list = $.parseJSON($('#ec3').attr('datastuff'))

  var attackcardslist = $.parseJSON($('#ac').attr('datastuff'))
  var tacticscardslist = $.parseJSON($('#tc').attr('datastuff'))

  var playerDeck = [];
  var playerHand = [];
  var enemyDeck1 = [];
  var enemyDeck2 = [];
  var enemyDeck3 = [];
  var currentEnemy = "";

  function enemySetup(){
    //deck1
    for (i = 0; i < 7; i++) {
      enemyDeck1.push(enemycards1list[0]);
    }
    for (i = 0; i < 5; i++) {
      enemyDeck1.push(enemycards1list[1]);
    }
    for (i = 0; i < 5; i++) {
      enemyDeck1.push(enemycards1list[2]);
    }
    for (i = 0; i < 2; i++) {
      enemyDeck1.push(enemycards1list[3]);
    }
    //deck2
    for (i = 0; i < 7; i++) {
      enemyDeck2.push(enemycards2list[0]);
    }
    for (i = 0; i < 5; i++) {
      enemyDeck2.push(enemycards2list[1]);
    }
    for (i = 0; i < 5; i++) {
      enemyDeck2.push(enemycards2list[2]);
    }
    for (i = 0; i < 2; i++) {
      enemyDeck2.push(enemycards2list[3]);
    }
    //deck 3
    for (i = 0; i < 7; i++) {
      enemyDeck3.push(enemycards3list[0]);
    }
    for (i = 0; i < 5; i++) {
      enemyDeck3.push(enemycards3list[1]);
    }
    for (i = 0; i < 5; i++) {
      enemyDeck3.push(enemycards3list[2]);
    }
    for (i = 0; i < 1; i++) {
      enemyDeck3.push(enemycards3list[3]);
    }
    for (i = 0; i < 1; i++) {
      enemyDeck3.push(enemycards3list[4]);
    }
    for (i = 0; i < 1; i++) {
      enemyDeck3.push(enemycards3list[5]);
    }
    shuffle(enemyDeck1);
    shuffle(enemyDeck2);
    shuffle(enemyDeck3);
    //starting enemy
    drawEnemy(enemyDeck1);
    console.log(currentEnemy);
    showEnemy(currentEnemy);
  }

  function drawEnemy(deck){
    currentEnemy = deck.shift();
  }

  function showEnemy(card){
    $('#enemypicture').append("<p>A picture of "+card.name+" goes here</p>");
    $('#enemystats').append("<div class='enemycard'>name:"+card.name+"<br>hp:"+card.hp+"<br>damage:"+card.damage+"<br>tech points:"+card.tp+"<br>victory points:"+card.vp+"<br>text:"+card.description+"</div>");
  }

  function playerSetup(){
    var start = [tacticscardslist[0],tacticscardslist[0],tacticscardslist[0],attackcardslist[0],attackcardslist[0],attackcardslist[0],attackcardslist[0],attackcardslist[0],attackcardslist[0],attackcardslist[0]];
    shuffle(start);

    for (i = 0; i < 5; i++) {
      playerHand.push(start.shift());
    }
    playerDeck = start;

    showPlayer();
  }

  function shuffle(array) {
    var currentIndex = array.length, temporaryValue, randomIndex ;

    // While there remain elements to shuffle...
    while (0 !== currentIndex) {

      // Pick a remaining element...
      randomIndex = Math.floor(Math.random() * currentIndex);
      currentIndex -= 1;

      // And swap it with the current element.
      temporaryValue = array[currentIndex];
      array[currentIndex] = array[randomIndex];
      array[randomIndex] = temporaryValue;
      }
      return array;
  }

  function showPlayer(){
    for (i = 0; i < playerHand.length; i++) {
      if (playerHand[i].hasOwnProperty('damage')){
        showAttackCard(playerHand[i]);
      }
      else {
        showTacticsCard(playerHand[i]);
      }
    }
  }

  function showAttackCard(card){
    $('#playerhand').append("<div class='playercard'>name:"+card.name+"<br>damage:"+card.damage+"<br>text:"+card.description+"</div>");
  }

  function showTacticsCard(card){
    $('#playerhand').append("<div class='playercard'>name:"+card.name+"<br>text:"+card.description+"</div>");
  }

  function drawCard(){
    playerHand.push(playerDeck.shift());
  }
});
