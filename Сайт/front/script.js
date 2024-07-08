function enlargeImage(img) {
  var fullscreenDiv = document.getElementById('fullscreen');
  var fullscreenImg = document.getElementById('fullscreenImage');
  fullscreenImg.src = img.src;
  fullscreenDiv.style.display = 'flex';
  
  fullscreenDiv.onclick = function() {
    fullscreenDiv.style.display = 'none';
  }
}