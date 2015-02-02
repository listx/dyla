$(document).ready(function() {
  $('.startnew').on('click', startSetup);
  $('#playersCards').on('click', '.playercard', selectCardtoPlay);
  $('.playselected').on('click', playSelectedCards);
  $('.refillhand').on('click', fillHand);
  $('.runaway').on('click',function(){
    drawEnemy();
    printMsg('You have escaped with minor damage!');
    loseHp(2);
  });

  var enemycards1list = $.parseJSON($('#ec1').attr('datastuff'))
  var enemycards2list = $.parseJSON($('#ec2').attr('datastuff'))
  var enemycards3list = $.parseJSON($('#ec3').attr('datastuff'))

  var attackcardslist = $.parseJSON($('#ac').attr('datastuff'))
  var tacticscardslist = $.parseJSON($('#tc').attr('datastuff'))

  var player = {
    hp:10,
    tp:0,
    vp:0
  };
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
    showPlayerStats();
    showDeckStats();
    $('.startnew').remove();
  }

  function showPlayerStats(){
    $('#infobar .playerhp').html(player.hp);
    $('#infobar .playertp').html(player.tp);
    $('#infobar .playervp').html(player.vp);
    $('#infobar .playerturn').html(turnCounter);
  }

  function showDeckStats(){
    $('#deckanddiscard .deckcount').html(playerDeck.length);
    $('#deckanddiscard .discardcount').html(playerDiscard.length);
  }

  function enemySetup(){
    // deck 1
    gatherEnemyCards1(10,0);
    gatherEnemyCards1(7,1);
    gatherEnemyCards1(5,2);
    gatherEnemyCards1(2,3);
    // deck 2
    gatherEnemyCards2(10,0);
    gatherEnemyCards2(7,1);
    gatherEnemyCards2(5,2);
    gatherEnemyCards2(2,3);
    //deck 3
    gatherEnemyCards3(10,0);
    gatherEnemyCards3(8,1);
    gatherEnemyCards3(6,2);
    gatherEnemyCards3(1,3);
    gatherEnemyCards3(1,4);
    gatherEnemyCards3(1,5);

    shuffle(enemyDeck1);
    shuffle(enemyDeck2);
    shuffle(enemyDeck3);
    //starting enemy
    drawEnemy(enemyDeck1);
  }

  function gatherEnemyCards1(num,cardid){
    for (var i = 0; i < num; i++) {
      enemyDeck1.push(enemycards1list[cardid]);
    }
  }
  function gatherEnemyCards2(num,cardid){
    for (var i = 0; i < num; i++) {
      enemyDeck2.push(enemycards2list[cardid]);
    }
  }
  function gatherEnemyCards3(num,cardid){
    for (var i = 0; i < num; i++) {
      enemyDeck3.push(enemycards3list[cardid]);
    }
  }

  function drawEnemy(){
    clearEnemy();
    if(enemyDeck1.length > 0){
      currentEnemy = enemyDeck1.shift();
    }
    else if(enemyDeck2.length > 0){
      currentEnemy = enemyDeck2.shift();
    }
    else {
      currentEnemy = enemyDeck3.shift();
    }
    showEnemy(currentEnemy);
  }

  function showEnemy(card){
    $('#enemypicture').append("<p>A picture of "+card.name+" goes here</p>");
    $('#enemystats').append("<div class='enemycard'>name:"+card.name+"<br>hp:"+card.hp+"<br>damage:"+card.damage+"<br>tech points:"+card.tp+"<br>victory points:"+card.vp+"<br>text:"+card.description+"</div>");
    $('.enemylevel').html(card.lvl);
  }

  function clearEnemy(){
    currentEnemy = "";
    $('#enemypicture p:nth-child(2)').remove();
    $('.enemycard').remove();
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
    showDeckStats();
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
    showDeckStats();
  }

  function reshuffleDiscard(){
    playerDeck = playerDeck.concat(playerDiscard);
    playerDiscard = [];
    showDeckStats();
  }

  function drawCards(num){
    for(i = 0; i < num; i++){
      if(playerHand.length < maxHandsize){
      playerHand.push(playerDeck.shift());
      }
    }
    showPlayer();
    showDeckStats();
  }

  function loseHp(lose){
    player.hp -= lose;
    printMsg('You have taken '+lose+' damage!');
    showPlayerStats();
  }

  function gainHp(gain){
    player.hp += gain;
    if(player.hp > 10){
      player.hp = 10;
    }
    printMsg('You have regained '+gain+' hit points.');
    showPlayerStats();
  }

  function loseTp(spend){
    player.tp -= spend;
    printMsg("You've spent "+spend+" tech points.");
    showPlayerStats();
  }

  function gainTp(gain){
    player.tp += gain;
    printMsg("You've gained "+gain+" tech points.");
    showPlayerStats();
  }

  function gainVp(gain){
    player.vp += gain;
    printMsg("Earned "+gain+" victory points!");
    showPlayerStats();
  }
});
