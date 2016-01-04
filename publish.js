var ghpages = require('gh-pages');
var path = require('path');
 
ghpages.publish(path.join(__dirname, ''), { src: 'index.html' }, function(err) { if(err) { return console.log(err); } });