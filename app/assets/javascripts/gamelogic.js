$(document).ready(function() {
  $('#enemy-cards').on('click', testFunc);
  $('#enemypicture').ready(setupCards);

  function setupCards(e) {
    var enemycards = $.ajax({
      url: '/gamestates/1'
    })
    .done(function(response) {
      console.log('success');
      //need to get expected jsons and do something with them
    })
    .fail(function(event) {
      console.log('You FAILED!!!');
    })
  }

  function testFunc() {
    console.log('successful test');
  }

});
