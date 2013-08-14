#!/usr/bin/env phantomjs

var page = require('webpage').create();
page.open('./index.html', function () {
    page.viewportSize = { width: 921, height: 600 };
    page.paperSize = { format: 'Letter', orientation: 'portrait', margin: '1cm' };
    window.setTimeout(function () {
        page.render('resume.pdf');
        phantom.exit();
    }, 200);
});
