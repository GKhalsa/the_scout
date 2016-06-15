// $(document).ready(function(){
  $(document).on('click', '#save', function(e) {
    // $(this).find('button').css('background', 'green');
    var id = $(this).data('id')
      $.ajax({
          dataType: 'json',
          method:'POST',
          url: '/saved_item',
          data: {item: id}
      });
  });


  $(".tiptext").mouseover(function() {
      var link = $(this).attr('href');
      var linkContent = "Walmart <iframe class='description' src='" + link +  "&output=embed" +  "'> </iframe>"
      $(this).html(linkContent)
      $(this).children(".description").show();
  }).mouseout(function() {
      $(this).children(".description").hide();
  });
