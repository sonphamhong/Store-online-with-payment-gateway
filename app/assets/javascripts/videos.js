jQuery( function($)
{
  $('.video video').on('ended', function () {
    
    this.load();
    this.play();
  });
});