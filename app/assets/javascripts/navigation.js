document.addEventListener("turbolinks:load", function() {
  // var openBtn = document.getElementById("burgerMenuBtn");
  // var navigation = document.getElementById("menuList");
  // var closeBtn = document.getElementById("closeMenuBtn");

  // openBtn.addEventListener("click", openMenu);
  // closeBtn.addEventListener("click", closeMenu);

  // function openMenu() {
  //   //console.log("Clicked");

  //   //display the navigation
  //   navigation.style.display = "flex";
  // }

  // function closeMenu() {
  //   navigation.style.display = "none";
  // }

  $('#hamburger').click(function(e){
    e.preventDefault(); 
    $(this).toggleClass('is-active');
    $("nav").toggleClass("open");
  });
});
