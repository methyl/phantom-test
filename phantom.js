var page = require('webpage').create();
phantom.injectJs('rawdeflate.js');
var url = 'http://phantom.local';
page.open(url, function(){console.log("opened webpage")});

var fs = require('fs');
var currentIndex = 0;

page.onCallback = function(data) {
    //fs.write("frames/"+currentIndex+".txt", data, 'w')
    console.log('saved frame '+currentIndex++)
};
