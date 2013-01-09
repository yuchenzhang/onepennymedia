jQuery(function(){
  jQuery('.share').hover(function(){jQuery(this).toggleClass('active');});
  jQuery('.share').each(function(){
    var shareButton = jQuery(this);
    var articleEle = shareButton.parent('.article');
    var articleUrl = encodeURIComponent(articleEle.find('.page-header a').attr('href'));
    var articleTitle = encodeURIComponent(articleEle.find('.page-header a').text());

    jQuery.each({
      'service-fb': 'http://www.facebook.com/sharer.php?t=#TITLE#&u=#URL#',
      'service-t':  'https://twitter.com/home?status=#TITLE#:#URL#',
      'service-li': 'http://www.linkedin.com/shareArticle?mini=true&url=#URL#&title=#TITLE#',
      'service-r':  'http://www.reddit.com/submit?url=#URL#&title=#TITLE#',
      'service-g':  'https://plus.google.com/share?url=#URL#&t=#TITLE#',
      'service-hn': 'http://news.ycombinator.com/submitlink?u=#URL#&t=#TITLE#'
    }, function(serviceClass, urlPattern){
      var shareUrl = urlPattern.replace('#URL#', articleUrl).replace('#TITLE#', articleTitle);
      shareButton.find('.'+serviceClass+' a').attr('href', shareUrl);
    });
  });
});
