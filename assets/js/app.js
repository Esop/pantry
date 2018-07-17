// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import "bootstrap"
import "signature_pad"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
//
//
//


var signaturePad = new SignaturePad(document.getElementById('signature-pad'), {
  backgroundColor: 'rgba(255, 255, 255, 0)',
  penColor: 'rgb(0, 0, 0)'
});

var saveButton = document.getElementById('save');
var cancelButton = document.getElementById('clear');

saveButton.addEventListener('click', function (event) {
  // var data = signaturePad.toDataURL('image/png');
  var data = signaturePad.toDataURL();

// Send data to server instead...
  window.open(data);
});

cancelButton.addEventListener('click', function (event) {
  signaturePad.clear();
});
