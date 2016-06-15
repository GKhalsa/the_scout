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
// });
