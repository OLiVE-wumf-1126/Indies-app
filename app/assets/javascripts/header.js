$(function(){
  $(".toggle").click(
    function() {
      $(this).next().slideToggle(300);
    }
  );
});