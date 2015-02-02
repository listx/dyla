$(document).ready(function() {
  $('.startnew').on('click', startSetup);
  $('#playersCards').on('click', '.playercard', selectCardtoPlay);
  $('.playselected').on('click', playSelectedCards);
  $('.drawtwo').on('click', fillHand);

  var enemycards1list = $.parseJSON($('#ec1').attr('datastuff'))
  var enemycards2list = $.parseJSON($('#ec2').attr('datastuff'))
  var enemycards3list = $.parseJSON($('#ec3').attr('datastuff'))

  var attackcardslist = $.parseJSON($('#ac').attr('datastuff'))
  var tacticscardslist = $.parseJSON($('#tc').attr('datastuff'))

  var initTacticsCards = 3;
  var initAttackCards = 7;
  var playerDeck = [];
  var playerHand = [];
  var playerDiscard = [];
  var enemyDeck1 = [];
  var enemyDeck2 = [];
  var enemyDeck3 = [];
  var currentEnemy = "";
  var turnCounter = 0;
  var maxMessages = 3;
  var maxHandsize = 5;
  var playingCards = [];

  function startSetup(){
    if(turnCounter === 0){
      enemySetup();
      playerSetup();
      turnCounter += 1;
    }
    $('.startnew').remove();
  }

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
    var start = [];
    for(i = 0; i < initTacticsCards; i++) {
      start.push(tacticscardslist[0]);
    }
    for(i = 0; i < initAttackCards; i++) {
      start.push(attackcardslist[0]);
    }
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

  function clearPlayer(){
    $('#playersCards').html("");
  }

  function showPlayer(){
    clearPlayer();
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
    $('#playersCards').append("<div class='playercard noplay'>image here<br>name:"+card.name+"<br>damage:"+card.damage+"<br>text:"+card.description+"</div>");
  }

  function showTacticsCard(card){
    $('#playersCards').append("<div class='playercard noplay'>image here<br>name:"+card.name+"<br>text:"+card.description+"</div>");
  }

  function selectCardtoPlay(){
    if($(this).attr('class') === 'playercard noplay'){
    $(this).attr('class', 'playercard play')
    }
    else {
      $(this).attr('class', 'playercard noplay')
    }
  }

  function playSelectedCards(){
    var playTheseCards = [];
    var idx = 0;
    // find all cards to play
    while(idx < maxHandsize) {
      if($( "div#playersCards div:nth-child("+idx+")" ).attr('class') === 'playercard play'){
        //save indexes of cards to play
        printMsg("You have played "+playerHand[idx - 1].name);
        playTheseCards.push(idx - 1);
      }
      idx++;
    }
    //wipe html of all played cards
    $('#playersCards div.play').remove()
    for(i = 0; i < playTheseCards.length; i++){
      //move copy to discard and playing cards array
      playerDiscard.push(playerHand[playTheseCards[i]]);
      playingCards.push(playerHand[playTheseCards[i]]);
      //mark cards in hand to delete
      playerHand[playTheseCards[i]] = 'del'
    }
    //delete them
    for(i = 0; i < playTheseCards.length; i++){
      var temp = playerHand.indexOf('del');
      playerHand.splice(temp, 1);
    }
  }

  function printMsg(string) {
    if($('.gamelog li').length === maxMessages){
      $('.gamelog li:nth-child(1)').remove();
    }
    $('.gamelog ul').append('<li>'+string+'</li>');
  }

  function fillHand(){
    while(playerHand.length < maxHandsize){
      if(playerDeck.length < 1){
        reshuffleDiscard();
      }
      playerHand.push(playerDeck.shift());
    }
    showPlayer();
  }

  function reshuffleDiscard(){
    playerDeck = playerDeck.concat(playerDiscard);
    playerDiscard = [];
  }

  function drawCards(num){
    for(i = 0; i < num; i++){
      if(playerHand.length < maxHandsize){
      playerHand.push(playerDeck.shift());
      }
    }
    showPlayer();
  }
});
