
/* smooth scrolling for scroll to top */
$(document).ready(function(){
$('.scroll-top').click(function(){
  $('body,html').animate({scrollTop:0},800);
})
/* smooth scrolling for scroll down */
$('.scroll-down').click(function(){
  $('body,html').animate({scrollTop:$(window).scrollTop()+800},1000);
})

/* highlight the top nav as scrolling occurs */
$('body').scrollspy({ target: '#navbar' })

    setTimeout(function(){
    $('#flash').hide("drop");
    }, 5000);
})