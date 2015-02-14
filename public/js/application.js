$(document).ready(function() {
  $('#add_question').click(function(){

    $('#main').append('<form class="questions"> Question:<input type="text"><br>Choice 1:<input type="text"><br>Choice 2:<input type="text"><input value="Add Q to Survey" type="submit"></form>')


  })

  $('#main').submit(".questions input .submit",function(){
   //AJAX clall
   var surveyID = $('.survey_num').html();
   var question = $('.question').val();
   var choice1 = $('.choice1').val();
   var choice2 = $('.choice2').val();

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
