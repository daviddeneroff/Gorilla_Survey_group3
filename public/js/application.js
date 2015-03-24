$(document).ready(function() {

  $('#ajax_form').submit(function(e){
   //AJAX clall
   e.preventDefault();
   var lastQuestionID = $('#last_question_num').val();

   var QCount = parseInt(lastQuestionID) + 1;
   $('#last_question_num').val(QCount);


   var surveyID = $('#survey').data("survey_num");
   var question = $('.question_in').val();
   var choice1 = $('.choice1').val();
   var choice2 = $('.choice2').val();
   $('.question_in').val("");
   $('.choice2').val("");
   $('.choice1').val("");



  $.ajax({
    type: "post",
    data: {question: question, choice1: choice1, choice2: choice2},
    url: "/surveys/"+surveyID+"/add_questions",

    success: function(success) {

   }
 });
     // get last num

     $('section').append('<h2>#'+ QCount+' '+ question +'</h2>')
     $('section').append('<p>choice1: '+ choice1 +'</p>')
     $('section').append('<p>choice2: '+ choice2 +'</p>')


   })
});
