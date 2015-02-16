$(document).ready(function() {

  $('.add_question').submit(".questions input .submit",function(e){
   //AJAX clall
   e.preventDefault();
   var surveyID = $('#survey').data("survey_num");
   var question = $('.question_in').val();
   var choice1 = $('.choice1').val();
   var choice2 = $('.choice2').val();
   console.log("question " + question + " choice1 " + choice1)

  // Test Get id from form
  // Get ID from questions


var test2 =   $(this);
 console.log(test2);
 

     $.ajax({
        type: "post",
        data: {question: question, choice1: choice1, choice2: choice2},
        url: "/surveys/"+surveyID+"/add_questions",
        success: function(success) {
           console.log(success)
        }
      });
  })
});
