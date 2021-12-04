/**
 * 
 */

// HEADER
let ativado = false
window.onscroll = (e) => {
  const header = document.querySelector('header')
  if(window.scrollY >= 90 && !ativado) {
    ativado = true
    header.classList.toggle('active')
  } else if(window.scrollY < 90 && ativado) {
    ativado = false
    header.classList.toggle('active')
  }
}
// END HEADER

const swiper = new Swiper(".swiper", {
  // Optional parameters
  loop: true,
  autoplay: {
    delay: 5000
  },
  speed: 500,
  spaceBetween: 50,
  // If we need pagination
  pagination: {
    el: ".swiper-custom-pagination",
    clickable: true,
    renderBullet: function (index, className) {
      return `<span class=${className}>${index+1}</span>`;
    },
  },
  // Navigation arrows
  navigation: {
    nextEl: ".swiper-button-custom-next",
    prevEl: ".swiper-button-custom-prev"
  }
});


// ANIMAÇÃO
AOS.init({
  duration: 1000
});
// END ANIMAÇÃO
