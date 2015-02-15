$(document).ready(function() {
  $('#add_question').click(function(){



     var lastQuestionID = $('[data-q_num]').last().data("q_num");
     var LastFormID = $('[data-q_form]').last().data("q_form");
     var QCount = lastQuestionID + 1
     if (LastFormID){QCount = LastFormID+1}

  

    console.log(lastQuestionID);
    // get id of last question id and console log
    $('#main').append('<form data-q_form="'+QCount+'" class="add_question"> Question:<input type="text"><br>Choice 1:<input type="text"><br>Choice 2:<input type="text"><input value="Add Q to Survey" type="submit"></form>')


  })

  $('#main').submit(".questions input .submit",function(test){
   //AJAX clall
   var surveyID = $('.main').data("survey_num");
   var question = $('.question_in').val();
   var choice1 = $('.choice1').val();
   var choice2 = $('.choice2').val();
   console.log("question " + question + " choice1 " + choice1)

  // Test Get id from form
  // Get ID from questions


//Remove submit form for 
var test2 =   $(this);
 console.log(test2);
// find 

     // $.ajax({
     //    type: "post",
     //    data: {question: question, choice1: choice1, choice2: choice2},
     //    url: "/surveys/"+surveyID+"/add_questions",
     //    success: function(success) {
     //       console.log(success)
     //    }
     //  });
  })
});
