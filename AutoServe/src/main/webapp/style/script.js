var fs = require('fs');
var data = fs.readFileSync('registrationQueu.json');
var words = JSON.parse(data);
console.log(words);
//how to setup a json file?