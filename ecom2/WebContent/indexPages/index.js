var sidenavl = document.getElementById("s1");
var sidenavr = document.getElementById("s2");
var navbar = document.getElementById("nav1");
var sticky = navbar.offsetTop;

window.onscroll = function() {myFunction()};

function myFunction() {
  if (window.pageYOffset >= 5) {
    navbar.classList.add("sticky");
    console.log("added sticky to nav")
    sidenavl.classList.add("stickyl");
    sidenavr.classList.add("stickyl");
  } else {
    navbar.classList.remove("sticky");
    sidenavl.classList.remove("stickyl");
    sidenavr.classList.remove("stickyl");
  }
}
