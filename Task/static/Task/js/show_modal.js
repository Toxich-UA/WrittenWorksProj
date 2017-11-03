$('body').on('click', '[data-toggle="modal"]', function(){
  var target = $(this).data('target');
  $.ajax({
  dataType: 'json',
  url: '/modal/add_task/',
  success: function(output_data){
    console.log(output_data.task_template);
    $("#modal").html(output_data.task_template);

    /*===FormModal===*/

    $(document).on('change', ':file', function() {
      var input = $(this),
      numFiles = input.get(0).files ? input.get(0).files.length : 1,
      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
      input.trigger('fileselect', [numFiles, label]);
    });

    $(':file').on('fileselect', function(event, numFiles, label) {
      var input = $(this).parents('.input-group').find(':text'),
      log = numFiles > 1 ? numFiles + ' файла' : label;
      if( input.length ) {
        input.val(log);
      } else {
        if( log ) alert(log);
      }
    });


    /*===FormModal===*/
    //
  }
});

});