$(document).on('ready page:load', function() {
   $('.alert').delay(800).fadeOut('slow');
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]'});
    $('.rated').raty({ path: '/assets', 
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });
    $(".img-zoom").elevateZoom({ 
        zoomType	: "inner", 
        cursor: "crosshair"
    }); 
});



