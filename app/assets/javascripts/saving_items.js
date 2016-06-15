  $(document).on('click', '#save', function(e) {
    var id = $(this).data('id')
      $.ajax({
          dataType: 'json',
          method:'POST',
          url: '/saved_item',
          data: {item: id}
      });
  });
