function mykeydown(key) {
  var xhr= new XMLHttpRequest();
  xhr.open('GET', `http://${window.location.hostname}:19012/cgi-bin/keydown.sh?` + key , true);
  xhr.send();
}
function mykeyupmain(key) {
  var xhr= new XMLHttpRequest();
  xhr.open('GET', `http://${window.location.hostname}:19012/cgi-bin/keyup.sh?` + key , true);
  xhr.send();
}
function mykeyup(key) {
   mykeyupmain(key);
   setTimeout(mykeyupmain(key), 100);
}
function keyboardinit(keyrow) {
  var i = 0
  var keyboard = ``
  while (keyrow[i]) {

    keyboard = keyboard + `<button ontouchstart="mykeydown('${keyrow[i]}')" ontouchend="mykeyup('${keyrow[i]}')"  ontouchcancel="mykeyup('${keyrow[i]}')" class="vpad1" >${keyrow[i]}</button>`
    i++
  }
  return keyboard
}
function keyboard() {
  if(keyboardstate == 0) {
    keyboardon()
  }else {
    keyboardoff()
  }
}
function keyboardon() {
    document.getElementById("keyboard").style.display = 'block'
    keyboardstate = 1
}
function keyboardoff() {
    document.getElementById("keyboard").style.display = 'none'
    keyboardstate = 0
}

keyboardstate = 0
keyrow1 = ["Escape", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12"]
keyrow2 = ["acute", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "minus", "equal", "BackSpace"]
keyrow3 = ["Tab", "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "bracketleft", "bracketright", "Return"]
keyrow4 = ["Caps_Lock", "a", "s", "d", "f", "g", "h", "j", "k", "l", "semicolon", "apostrophe", `backslash`, "Return"]
keyrow5 = ["Shift_R", "z", "x", "c", "v", "b", "n", "m", "comma", "period", "slash", "Shift_L"]
keyrow6 = ["Control_R", "Super", "Alt_L", "space", "Alt_R", "Control_L", "Page_Up", "Page_Down", "Home", "End", "Delete", "Up", "Down", "Left", "Right"]
document.getElementById('keyboard').innerHTML = `<button class="vpad1" id="drag">Drag</button>` + keyboardinit(keyrow1) + '<br>'  + keyboardinit(keyrow2) +  '<br>' + keyboardinit(keyrow3) + '<br>' + keyboardinit(keyrow4) + '<br>' + keyboardinit(keyrow5) + '<br>' + keyboardinit(keyrow6)
keyboarddiv = document.getElementById("keyboard")
document.getElementById("drag").addEventListener("touchmove", (event) => {
  keyboarddiv.style.top = event.touches[0].screenY + "px"
  keyboarddiv.style.left = event.touches[0].screenX + "px"
  //console.log(event.touches[0].screenY)
});
document.body.style.overflow = 'hidden';
