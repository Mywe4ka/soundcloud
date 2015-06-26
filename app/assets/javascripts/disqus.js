$( document ).ready(function() {
  $("#disqus_thread").append(function(){
    var disqus_shortname = 'soundcloud2';
    var dsq = document.createElement('script');
    dsq.type = 'text/javascript';
    dsq.async = true;
    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);

  $('#user_photo').fileinput({
    showCaption: false,
    maxFilesNum: 1,
    allowedFileExtensions: ["jpg", "jpeg", "gif", "png"]
  });
  });

  $('#song_mfile').fileinput({
    showCaption: false,
    maxFilesNum: 1,
    allowedFileExtensions: ["mpeg", "mp3"]
  });
});