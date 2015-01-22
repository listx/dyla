$(document).ready(function() {
  $('#enemypicture').on('click', playerSetup);
  $('#enemypicture').ready(testFunc);

  function testFunc() {
    console.log('successful test');
    $('#enemycardsreference').append("hi"+enemycards1list[1].name+" there");
  }

  var enemycards1list = $.parseJSON($('#ec1').attr('datastuff'))
  console.log(enemycards1list);
  var enemycards2list = $.parseJSON($('#ec2').attr('datastuff'))
  var enemycards3list = $.parseJSON($('#ec3').attr('datastuff'))

  var attackcardslist = $.parseJSON($('#ac').attr('datastuff'))
  var tacticscardslist = $.parseJSON($('#tc').attr('datastuff'))

  var playerDeck = [];
  var playerHand = [];

  function playerSetup(){
    var start = ["tc1","tc1","tc1","ac1","ac1","ac1","ac1","ac1","ac1","ac1"];
    shuffle(start);

    for (i = 0; i < 5; i++) {
      playerHand.push(start.shift());
    }
    playerDeck = start;
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

  function drawCard(){
    playerHand.push(playerDeck.shift());
  }
});
