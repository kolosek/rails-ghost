document.addEventListener('DOMContentLoaded', function(e){
  let links = Array.from(document.getElementsByClassName('js-book-call'));

  for (let link of links) {
    link.addEventListener('click', function(e) {
      dataLayer.push({event: 'schedule-a-demo'});
    });
  }

  return true;
});
