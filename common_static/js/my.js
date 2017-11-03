function setEqualHeight(columns){
  var tallestcoloumn = 0;
  columns.each(
    function()
    {
      currentHeight = $(this).height();
      if(currentHeight > tallestcoloumn)
      {
        tallestcoloumn = currentHeight;
      }
    }
    );
  columns.height(tallestcoloumn);
}
//Ready doc
$(function() {

  setEqualHeight($(".task-content > div"));
  
  /*===Menu===*/

  $('.navbar-toggle').click(function () {
    $('.navbar-nav').toggleClass('slide-in');
    $('.side-body').toggleClass('body-slide-in');
    $('#search').removeClass('in').addClass('collapse').slideUp(200);   
  });

// Remove menu for searching
$('#search-trigger').click(function () {
  $('.navbar-nav').removeClass('slide-in');
  $('.side-body').removeClass('body-slide-in');
});

/*===Menu===*/

/*===Modal===*/

});


