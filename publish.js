'use strict';

const ghPages = require('gh-pages');
const path = require('path');

ghPages.publish(
  path.join(__dirname, 'build'), {
    src: 'index.html'
  },
  function(err) {
    if(err) {
      return console.log(err);
    }
  }
);
