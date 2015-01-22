$(document).ready(function() {
  $('#enemypicture').on('click', testFunc);

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
});
