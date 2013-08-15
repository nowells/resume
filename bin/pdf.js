#!/usr/bin/env phantomjs

var page = require('webpage').create();
page.open('./index.html', function () {
    page.viewportSize = { width: 921, height: 600 };
    page.paperSize = { format: 'Letter', orientation: 'portrait', margin: '1cm' };

    window.setTimeout(function () {
        page.evaluate(function () {
            var links = document.getElementsByTagName('link');
            for (var i = 0, len = links.length; i < len; ++i) {
                var link = links[i];
                if (link.media == 'print') {
                    link.media = 'all';
                }
            }
            $(window).trigger('resize');
        });

        setTimeout(function() {
            page.render('resume.pdf');
            phantom.exit();
        }, 200);
    }, 200);
});
