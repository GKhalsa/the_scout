  $(document).on('click', '#save', function(e) {
    var itemName = $(this).parent().children(':nth-child(2)').html();
    flashMessage(itemName);
    var id = $(this).data('id');
      $.ajax({
          dataType: 'json',
          method:'POST',
          url: '/saved_item',
          data: {item: id}
      });
  });

  function flashMessage(itemName){
  }
