// $(function() {
//   console.log("OK");
//   $(".host-icon").on("click", ()  => {
//     $(".header-nav-menu").toggle();
//   });
  
// });

$(document).on('turbolinks:load', function() {
  console.log("OK");
  $(".host-icon").on("click", ()  => {
    $(".header-nav-menu").toggle();
  });
});

