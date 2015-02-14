$(document).ready(function() {
 $(".Post").click(function(event) {
      event.preventDefault();
       var postid = $('.getpost').val();
      $.ajax({
        type: "post",
        url: "/ajax_vote/" + postid,
        success: function(success) {
           $('#vote_count').html(success)
        }
      });
    }
  );

 $("#comment_post").submit(function(event) {
      event.preventDefault();
       var postid = $('.getpost').val();
      $.ajax({
        data: $(this).serialize(),
        type: "post",
        url: "/ajax_comment/" + postid,
        success: function(success) {
            $('.comment_box').prepend("<p>"+ success.content +"</p>");
        }
      });
    }
  );



 });
